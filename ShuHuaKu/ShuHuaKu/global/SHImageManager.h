//
//  KDImageManager.h
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *
 *   缩略写法
 *   GLOBALIMG.xxxxxx
 *   获取全局值
 *
 **/
#define GLOBALIMG   ((SHImageManager*)[SHImageManager sharedInstance])

@interface SHImageManager : NSObject
+ (instancetype)sharedInstance;

#pragma mark - 导航
@property (nonatomic, strong) UIImage *doback;//返回
#pragma mark - tabbar
@property (nonatomic, strong) UIImage *ic_bottom_find_select;
@property (nonatomic, strong) UIImage *ic_bottom_find;
@property (nonatomic, strong) UIImage *ic_bottom_home_select;
@property (nonatomic, strong) UIImage *ic_bottom_home;
@property (nonatomic, strong) UIImage *ic_bottom_hot_select;
@property (nonatomic, strong) UIImage *ic_bottom_hot;
@property (nonatomic, strong) UIImage *ic_bottom_mine_select;
@property (nonatomic, strong) UIImage *ic_bottom_mine;
@property (nonatomic, strong) UIImage *ic_bottom_share_select;
@property (nonatomic, strong) UIImage *ic_bottom_share;


#pragma mark - loding
@property (nonatomic, strong) UIImage *refreshLoadImgae;//菊花
@property (nonatomic, strong) UIImage *userbackground;
@end
