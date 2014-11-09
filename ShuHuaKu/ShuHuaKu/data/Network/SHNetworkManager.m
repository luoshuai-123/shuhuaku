//
//  KDNetworkManager.m
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

/**
 *
 *   网络请求管理
 *   接收网络请求命令
 *
 *   内部请求为Soap Websevice请求
 *
 *   单例模式,管理一个请求的队列
 *   返回队列中与网络请求命令对应的操作对象NSOperation
 *
 **/


#import "SHNetworkManager.h"
#import "AFHTTPRequestOperation+QMEX.h"
#import "AFNetworking.h"
#import "SHLogManager.h"
@interface SHNetworkManager ()
@property (strong,nonatomic) AFHTTPRequestOperationManager * manager_new;
@property (strong,nonatomic) NSMutableArray * requestingCommands;
@end
@implementation SHNetworkManager
-(NSMutableArray*)requestingCommands{
    if (_requestingCommands) {
        return _requestingCommands;
    }
    return _requestingCommands = [NSMutableArray arrayWithCapacity:0];
}
//单例
+ (SHNetworkManager *)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static SHNetworkManager * _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    
    return _sharedObject;
}
- (id)init
{
    self = [super init];
    if (self) {
        self.manager_new = [AFHTTPRequestOperationManager manager];
        [self.manager_new.operationQueue setMaxConcurrentOperationCount:NET_MAX_OPERATIONCOUNT];
    }
    return self;
}
#pragma mark - new

+(BOOL)isRunloopCommand:(WSBaseCommand*)command{
    return NO;
}

+ (NSOperation*)requestWithNewCommand:(WSBaseCommand *)command{
    AFHTTPRequestOperationManager * manager = [self sharedInstance].manager_new;
    
    @synchronized ([self sharedInstance].requestingCommands){
        for (WSBaseCommand * command_r in [self sharedInstance].requestingCommands) {
            if ([NSStringFromClass([command_r class]) isEqualToString:NSStringFromClass([command class])]) {
                NSLog(@"\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n\n有重复请求－－－－\n\n%@\n\n\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!",[command class]);
                return nil;
            }
        }
        if (![self isRunloopCommand:command]) {
            [[self sharedInstance].requestingCommands safeAddObject:command];
        }
    }
    
    
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    __block WSBaseCommand * cmd = command;
    AFHTTPRequestOperation * op = [manager POST:command.path parameters:command.form success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (cmd) {
            [[self sharedInstance].requestingCommands removeObject:cmd];
        }
        
        [SHNetCompleteManager creatAndLogWithURL:operation.request.URL.absoluteString apiName:NSStringFromClass([command class]) result:operation.responseString startDate:operation.af_startDate completeDate:[NSDate date]];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            command.output = [[command.output class] objectFromDictionary:responseObject];
        }
        
        if (command.callback) {
            command.callback(command,operation,nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (cmd) {
            [[self sharedInstance].requestingCommands removeObject:cmd];
        }
        
        [SHNetCompleteManager creatAndLogWithURL:operation.request.URL.absoluteString apiName:NSStringFromClass([command class]) result:operation.responseString startDate:operation.af_startDate completeDate:[NSDate date]];
        if (command.callback) {
            command.callback(command,operation,error);
        }
        
    }];
    [SHNetStartLogManager creatAndLogSoapStart:[op.request.URL absoluteString] api:NSStringFromClass([command class]) soapMsg:[command.form description]];
    op.af_startDate = [NSDate date];
    return op;

}
@end
