//
//  UIButton+CustomColor.m
//  Jiukuaiyou_2.0
//
//  Created by lee on 14-4-17.
//  Copyright (c) 2014年 QM. All rights reserved.
//

#import "UIButton+CustomColor.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIButton (CustomColor)

+(UIButton *)buttonWithCustomColor:(CustomColorButton )customColorButton frame:(CGRect )frame
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    switch (customColorButton) {
        case GaryColorButton:
        {
        }
            break;
        case GreenColorButton:
        {
        }
            break;
        case RedColorButton:
        {
        }
            break;
        default:
            break;
    }
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:3]; //设置矩形四个圆角半径
    return btn;
}

+(void)setButtonWithCustomColor:(CustomColorButton )customColorButton button:(UIButton *)button
{
    switch (customColorButton) {
        case GaryColorButton:
        {
        }
            break;
        case GreenColorButton:
        {
        }
            break;
        case RedColorButton:
        {
        }
            break;
        default:
            break;
    }
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:3]; //设置矩形四个圆角半径
}
@end
