//
//  NSString+UI.h
//  Juanpi_2.0
//
//  Created by Brick on 14-2-28.
//  Copyright (c) 2014年 Juanpi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UI)

- (CGSize)getUISize:(UIFont*)font limitWidth:(CGFloat)width;
@end


@interface NSString (File)
+ (NSString *)pathName;//文件名字
@end