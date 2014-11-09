//
//  KDUserValue.h
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import "Jastor.h"

@interface SHUserValue : Jastor
/**
 *  登录状态
 */
@property (strong, nonatomic) NSNumber *islogin;//





- (void)saveToDisk;              //存盘
- (void)saveInfo:(id)output;    //保存数据
- (void)logoutSave;             //删除数据
@end
