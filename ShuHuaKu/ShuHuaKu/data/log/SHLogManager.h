//
//  KDLogManager.h
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHLogManager : NSObject
@property (strong, nonatomic) NSMutableString *logContent;

- (void)log;

@end


// Net

@interface SHNetStartLogManager : SHLogManager

+ (void)creatAndLogSoapStart:(NSString *)completeURL api:(NSString *)apiName soapMsg:(NSString *)soapMsg;

@end

@interface SHNetCompleteManager : SHLogManager

+ (void)creatAndLogWithURL  :(NSString *)completeURL
        apiName             :(NSString *)apiName
        result              :(NSString *)result
        startDate           :(NSDate *)startDate
        completeDate        :(NSDate *)completeDate;

@end