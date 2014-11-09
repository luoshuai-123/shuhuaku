//
//  UILabel+QMTitle.h
//  Jiukuaiyou_2.0
//
//  Created by Brick on 14-4-18.
//  Copyright (c) 2014年 QM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (QMTitle)
/**
 *  文字顶对齐
 */
-(void)alignToTop;

- (void)addWithContinuousRegistrationArray:(NSArray *)dic;
/**
 *  返回文字宽高
 */
- (CGSize)getSize;

- (void)addalignment:(NSTextAlignment)alignment backgroundColor:(UIColor*)color titleColor:(UIColor*)titleColor labelTag:(int)tag font:(UIFont *)fontSize;
@end
