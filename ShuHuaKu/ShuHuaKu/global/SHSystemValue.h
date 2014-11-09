//
//  KDSystemValue.h
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYSTEMVALUE [SHSystemValue sharedInstance]

@interface SHSystemValue : NSObject

+ (instancetype)sharedInstance;


@property (strong, nonatomic) NSNumber    *systemVersion; // 系统版本号
@property (strong, nonatomic) NSString      *deviceName;    // 设备名称
@property (strong, nonatomic) NSString      *app_Name;      // APP名字
@property (strong, nonatomic) NSString      *app_Version;   // APP版本
@property (strong, nonatomic) NSString      *app_build;     // APP build号
@property (strong, nonatomic) NSNumber    * isJailBreak;

@property (strong, nonatomic) NSNumber    *screenHeight;   // 屏幕尺寸(物理尺寸)
@property (strong, nonatomic) NSNumber    *screenWidth;


@end
