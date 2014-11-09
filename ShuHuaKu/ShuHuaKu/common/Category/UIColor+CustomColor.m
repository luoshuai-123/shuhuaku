//
//  UIColor+CustomColor.m
//  Juanpi
//
//  Created by luoyi on 13-12-31.
//  Copyright (c) 2013年 Juanpi. All rights reserved.
//

#import "UIColor+CustomColor.h"

//color
#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]


@implementation UIColor (CustomColor)

+(UIColor*)r:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}


+(UIColor*)homePage_background{
    return [UIColor r:236 g:236 b:236 a:1];
//    return HexRGB(0x333333);
}
+ (UIColor *)home_jacinthColor{
    return [UIColor blueColor];
}
@end
