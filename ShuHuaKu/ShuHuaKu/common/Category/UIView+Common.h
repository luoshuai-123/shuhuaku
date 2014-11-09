//
//  UIView+Common.h
//  Juanpi_2.0
//
//  Created by lee on 14-2-18.
//  Copyright (c) 2014年 Juanpi. All rights reserved.
//


/**
 
 View类扩展
 
 **/

#import <UIKit/UIKit.h>

@interface UIView (Common)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;


@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGFloat centerX;

- (void)addRadius;
-(void)addBrderWidth;
//摇晃
- (void)shakeView;
/**
 *  半圆
 */
- (void)addSemicircle;
- (void)showAnimation;//显示View
- (void)hideView;//隐藏View

/**
 *  线
 *
 *  @param rect 大小坐标
 *
 *  @return UIView
 */
+(UIView *)lineView:(CGRect )rect;
@end
