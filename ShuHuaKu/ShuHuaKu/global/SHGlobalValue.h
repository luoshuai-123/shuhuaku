//
//  KDGlobalValue.h
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import "Jastor.h"
#import "SHUserValue.h"
#import "SHSaveKeyChain.h"//keyChain
/**
 *
 *   缩略写法
 *   GLOBALVALUE.xxxxxx
 *   获取全局值
 *
 **/
#define GLOBALVALUE [SHGlobalValue sharedInstance]

#define GLOBALVALUE_USERVALUE           @"GLOBALVALUE_USERVALUE"


@interface SHGlobalValue : Jastor
+ (instancetype)sharedInstance;

#pragma mark - 永久存储的字段
@property (strong, nonatomic) NSString     * openUUID;



#pragma mark - 用户退出重置的字段
@property (strong, nonatomic) SHUserValue * userValue;





/**
 @返回 YES 有摄像头
 */
- (BOOL)isCaptureCamera;








@end
