//
//  KDImageManager.m
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import "SHImageManager.h"

@implementation SHImageManager

//单例
+ (instancetype)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static SHImageManager * _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    
    return _sharedObject;
}
- (UIImage *)doback{
    if (_doback) {
        return _doback;
    }
    _doback = [UIImage imageNamed:@"111"];
    return _doback;
}

- (UIImage *)ic_bottom_find_select{
    if (_ic_bottom_find_select) {
        return _ic_bottom_find_select;
    }
    return _ic_bottom_find_select = [UIImage imageNamed:@"ic_bottom_find_select"];
}

- (UIImage *)ic_bottom_find{
    if (_ic_bottom_find) {
        return _ic_bottom_find;
    }
    return _ic_bottom_find = [UIImage imageNamed:@"ic_bottom_find"];
}


- (UIImage *)ic_bottom_home_select{
    if (_ic_bottom_home_select) {
        return _ic_bottom_home_select;
    }
    return _ic_bottom_home_select = [UIImage imageNamed:@"ic_bottom_home_select"];
}


- (UIImage *)ic_bottom_home{
    if (_ic_bottom_home) {
        return _ic_bottom_home;
    }
    return _ic_bottom_home = [UIImage imageNamed:@"ic_bottom_home"];
}


- (UIImage *)ic_bottom_hot_select{
    if (_ic_bottom_hot_select) {
        return _ic_bottom_hot_select;
    }
    return _ic_bottom_hot_select = [UIImage imageNamed:@"ic_bottom_hot_select"];
}


- (UIImage *)ic_bottom_hot{
    if (_ic_bottom_hot) {
        return _ic_bottom_hot;
    }
    return _ic_bottom_hot = [UIImage imageNamed:@"ic_bottom_hot"];
}


- (UIImage *)ic_bottom_mine_select{
    if (_ic_bottom_mine_select) {
        return _ic_bottom_mine_select;
    }
    return _ic_bottom_mine_select = [UIImage imageNamed:@"ic_bottom_mine_select"];
}


- (UIImage *)ic_bottom_mine{
    if (_ic_bottom_mine) {
        return _ic_bottom_mine;
    }
    return _ic_bottom_mine = [UIImage imageNamed:@"ic_bottom_mine"];
}


- (UIImage *)ic_bottom_share_select{
    if (_ic_bottom_share_select) {
        return _ic_bottom_share_select;
    }
    return _ic_bottom_share_select = [UIImage imageNamed:@"ic_bottom_share_select"];
}


- (UIImage *)ic_bottom_share{
    if (_ic_bottom_share) {
        return _ic_bottom_share;
    }
    return _ic_bottom_share = [UIImage imageNamed:@"ic_bottom_share"];
}

@end
