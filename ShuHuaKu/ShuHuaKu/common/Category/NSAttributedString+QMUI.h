//
//  NSAttributedString+QMUI.h
//  Juanpi_2.0
//
//  Created by luoshuai on 14-4-25.
//  Copyright (c) 2014年 Juanpi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (QMUI)
- (CGFloat)boundingWidthForHeight:(CGFloat)inHeight; //获取高度
- (CGFloat)boundingHeightForWidth:(CGFloat)inWidth; //获取宽度
@end
