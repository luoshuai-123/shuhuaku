//
//  KDLogManager.m
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import "SHLogManager.h"

@implementation SHLogManager
-(void)log{
    NSLog(@"%@",self.logContent);
}

-(NSMutableString*)logContent{
    NSMutableString * string = [[NSMutableString alloc]initWithCapacity:0];
    return string;
}
@end



@interface SHNetStartLogManager ()

@property (strong, nonatomic) NSString * apiName;
@property (strong, nonatomic) NSString * soapMessage;
@property (strong, nonatomic) NSString * completeURL;

@end

@interface SHNetCompleteManager ()
@property (strong, nonatomic) NSString * apiName;
@property (strong, nonatomic) NSString * completeURL;
@property (strong, nonatomic) NSString * result;
@property (strong, nonatomic) NSDate   * startDate;
@property (strong, nonatomic) NSDate   * completeDate;
@end

@implementation SHNetStartLogManager


+(void)creatAndLogSoapStart:(NSString*)completeURL api:(NSString*)apiName soapMsg:(NSString*)soapMsg{
    SHNetStartLogManager * manager = [[SHNetStartLogManager alloc]init];
    manager.completeURL = completeURL;
    manager.apiName = apiName;
    manager.soapMessage = soapMsg;
    [manager log];
}

-(NSMutableString*)logContent{
    
    NSMutableString * string = [super logContent];
    
    [string appendString:[NSString stringWithFormat:@"\n"
                          "----------------------------------------------------------\n"
                          "发起请求:\n"
                          "请求API:\n"
                          "             %@\n"
                          "请求URL:\n"
                          "             %@\n"
                          "请求参数:\n"
                          "             %@\n"
                          "----------------------------------------------------------\n"
                          ,self.apiName,self.completeURL,self.soapMessage
                          ]];
    
    return string;
}

@end


@implementation SHNetCompleteManager

/*输出的格式方法*/
+(void)creatAndLogWithURL:(NSString*)completeURL
                  apiName:(NSString*)apiName
                   result:(NSString*)result
                startDate:(NSDate*)startDate
             completeDate:(NSDate*)completeDate{
    
    SHNetCompleteManager * manager = [[SHNetCompleteManager alloc]init];
    manager.completeURL = completeURL;
    manager.result = result;
    manager.startDate = startDate;
    manager.completeDate = completeDate;
    manager.apiName = apiName;
    [manager log];
    
}

-(NSMutableString*)logContent{
    
    
    NSMutableString * string = [super logContent];
    
    NSTimeInterval  time =[self.completeDate timeIntervalSinceDate:self.startDate];
    
    [string appendString:[NSString stringWithFormat:@"\n"
                          "----------------------------------------------------------\n"
                          "完成请求:\n"
                          "请求API:\n"
                          "             %@\n"
                          "请求URL:\n"
                          "             %@\n"
                          "接口耗时:\n"
                          "             %.3f毫秒\n"
                          "返回数据:\n"
                          "\n"
                          "%@\n"
                          "\n"
                          "----------------------------------------------------------\n"
                          ,self.apiName,self.completeURL,time*1000,self.result
                          ]];
    
    return string;
}

@end
