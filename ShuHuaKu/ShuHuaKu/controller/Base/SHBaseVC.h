//
//  SHBaseVC.h
//  ShuHuaKu
//
//  Created by luoshuai on 14/10/21.
//  Copyright (c) 2014年 WS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHBaseNC.h"
@interface SHBaseVC : UIViewController
/**
 *  默认标题
 */
@property (nonatomic, strong) NSString *parentTitle;
/**
 *  扩展标题名字
 */
@property (nonatomic, strong) UIView *parentNavView;
/**
 *  左边按钮
 */
@property (nonatomic, strong) UIView *leftItemView;

/**
 *  右边按钮
 */
@property (nonatomic, strong) UIView *rigthItemView;

//左边按钮
- (void)addButtonReturn:(SEL)buttonClicked leftImage:(id)image pressImage:(UIImage *)pressImage;
//自定义左边按钮
- (void)addLeftItemView:(UIView *)leftView;

//右边按钮
- (void)addRightButton:(SEL)buttonClicked rightImage:(id)image  pressImage:(UIImage *)pressImage;
//自定义右边按钮
- (void)addRightItemView:(UIView *)rightView;

- (SHBaseNC *)navigationControllerView:(UIViewController *)controller;


@end
