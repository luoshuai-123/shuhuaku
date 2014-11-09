//
//  KDSaveKeyChain.h
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHSaveKeyChain : NSObject
+ (id)load:(NSString *)service;
+ (void)save:(NSString *)service data:(id)data;
@end
