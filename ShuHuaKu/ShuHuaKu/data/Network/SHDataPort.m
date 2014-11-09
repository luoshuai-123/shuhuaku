//
//  MYDataPort.m
//  MingYi
//
//  Created by LuoShuai on 14-6-5.
//  Copyright (c) 2014年 QQ:5793348. All rights reserved.
//

#import "SHDataPort.h"
#import "AFNetworking.h"

/**
 *  初始化头部http://app.myzxcdn.com/
 */
static NSString * const AFAppDotNetAPIBaseURLString = @"http://www.shuhuaku.com/";

@implementation SHDataPort


/**
 *  主要出口
 *
 *  @param URLString       url
 *  @param commandCallback 回调
 */
+ (void)GET:(NSString *)URLString globalTimelinePostsWithBlock:(SHCommandCallback)commandCallback{
    
    NSString *URL = [AFAppDotNetAPIBaseURLString stringByAppendingString:URLString];
    URL = [URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];


    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer= [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject==%@",responseObject);
        if (commandCallback) {
            commandCallback(responseObject,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (commandCallback) {
            commandCallback(nil,error);
        }
    }];
    
}


+ (void)POST:(NSString *)urlString postInfo:(NSDictionary *)info  globalTimelinePostsWithBlock:(SHCommandCallback)commandCallback{
    if (info == nil || [info count] <= 0){
        return;
    }
    
    NSString *URL = [AFAppDotNetAPIBaseURLString stringByAppendingString:urlString];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer= [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:URL parameters:info success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject==%@",responseObject);
        if (commandCallback) {
            commandCallback(responseObject,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (commandCallback) {
            commandCallback(nil,error);
        }
    }];
    
}
//@"http://upimg.myzx.cn/index.php?";//
+ (void)POSTImage:(NSString *)urlString postInfo:(NSDictionary *)info pic:(NSDictionary*)picS globalTimelinePostsWithBlock:(SHCommandCallback)commandCallback{

    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:urlString parameters:info constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:[picS objectForKey:@"Filedata"] name:@"action" fileName:@"" mimeType:@"image/jpeg"];
        
    } error:nil];
    
    
    AFHTTPRequestOperation *req = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    req.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"multipart/form-data"];
    [req setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
         NSLog(@"%d-------%lld-------%lld",bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    }];
    
    [req setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]; //此处要用UTF8解码
        NSError *error = nil;
        NSDictionary *value = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
        NSLog(@"222222222>>>>%@",[value objectForKey:@"msg"]);
        
        if (commandCallback) {
            commandCallback(value,nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (commandCallback) {
            commandCallback(nil,error);
        }
    }];
    
    
    
    [req start];
}


@end
