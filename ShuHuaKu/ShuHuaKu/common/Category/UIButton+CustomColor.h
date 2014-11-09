//
//  UIButton+CustomColor.h
//  Jiukuaiyou_2.0
//
//  Created by lee on 14-4-17.
//  Copyright (c) 2014年 QM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CustomColor)

typedef enum{
    GaryColorButton = 0,
    GreenColorButton,
    RedColorButton
}CustomColorButton;

+(UIButton *)buttonWithCustomColor:(CustomColorButton )customColorButton frame:(CGRect )frame;

+(void)setButtonWithCustomColor:(CustomColorButton )customColorButton button:(UIButton *)button;
@end
