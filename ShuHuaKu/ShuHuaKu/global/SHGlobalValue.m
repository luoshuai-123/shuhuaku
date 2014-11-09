//
//  KDGlobalValue.m
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import "SHGlobalValue.h"
#import <AVFoundation/AVFoundation.h>
#import <AdSupport/AdSupport.h>
#import "sys/utsname.h"
#import "SHSaveKeyChain.h"

@implementation SHGlobalValue
+ (instancetype)sharedInstance{
    static dispatch_once_t pred = 0;
    __strong static SHGlobalValue * _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        NSDictionary * userVD = [[NSUserDefaults standardUserDefaults]objectForKey:GLOBALVALUE_USERVALUE];
        if (userVD) {
            self.userValue = [SHUserValue objectFromDictionary:userVD];
        }
        [self registerNotification];
    }
    return self;
}

#pragma mark - 处理通知
-(void)registerNotification{
    [self observeNotification:NOTIFY_LoginSaveUer];
    [self observeNotification:NOTIFY_LogoutSaveUser];
}
#pragma mark - 通知回调
- (void)handleNotification:(NSNotification *)notification{
    if ([notification.name isEqualToString:NOTIFY_LoginSaveUer]) {
        [self.userValue saveInfo:notification.object];
    }
    if ([notification.name isEqualToString:NOTIFY_LogoutSaveUser]) {
        [self.userValue logoutSave];
    }
}












#pragma mark - 永久存储的字段
-(NSString*)openUUID{
    
    if (_openUUID) {
        return _openUUID;
    }
    NSString * udid = [SHSaveKeyChain load:[NSString stringWithFormat:@"kd.%@.udid",APP_Name]];
    if (udid) {
        return _openUUID = udid;
    }else{
        
        udid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        [SHSaveKeyChain save:[NSString stringWithFormat:@"kd.%@.udid",APP_Name] data:udid];
        _openUUID = udid;
        return _openUUID;
    }
}










- (BOOL)isCaptureCamera{
    NSError *error = nil;
    [AVCaptureDeviceInput deviceInputWithDevice:
     [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo]
                                          error:&error];
    if (error) {
        return NO;
    }else{
        return YES;
    }
}

@end
