//
//  NSAttributedString+QMUI.m
//  Juanpi_2.0
//
//  Created by luoshuai on 14-4-25.
//  Copyright (c) 2014年 Juanpi. All rights reserved.
//

#import "NSAttributedString+QMUI.h"
#import <CoreText/CoreText.h>
@implementation NSAttributedString (QMUI)


-(CGFloat)boundingWidthForHeight:(CGFloat)inHeight
{
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef) self);
    CGSize suggestedSize= CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0),NULL, CGSizeMake(CGFLOAT_MAX, inHeight), NULL);
    CFRelease(framesetter);
    return suggestedSize.width;
}

- (CGFloat)boundingHeightForWidth:(CGFloat)inWidth
{
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef) self);
    CGSize suggestedSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0),NULL, CGSizeMake(inWidth, CGFLOAT_MAX), NULL);
    CFRelease(framesetter);
    return suggestedSize.height;
}
@end
