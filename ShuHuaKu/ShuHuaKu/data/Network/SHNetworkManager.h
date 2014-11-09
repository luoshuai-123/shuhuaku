//
//  KDNetworkManager.h
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSBaseCommand.h"
@interface SHNetworkManager : NSObject
+ (NSOperation*)requestWithNewCommand:(WSBaseCommand *)command;
@end
