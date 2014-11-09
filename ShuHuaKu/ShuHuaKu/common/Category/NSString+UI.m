//
//  NSString+UI.m
//  Juanpi_2.0
//
//  Created by Brick on 14-2-28.
//  Copyright (c) 2014年 Juanpi. All rights reserved.
//

#import "NSString+UI.h"

@implementation NSString (UI)

- (CGSize)getUISize:(UIFont*)font limitWidth:(CGFloat)width{


    //设置字体
    CGSize size = CGSizeMake(width, 20000.0f);//注：这个宽：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    if ([SYSTEMVALUE.systemVersion floatValue]>=7)//IOS 7.0 以上
    {
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
        size =[self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    }
//    else
//    {
//        
//
//        if ([self respondsToSelector:@selector(sizeWithFont:constrainedToSize:lineBreakMode:)]) {
//            
//            size = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];//ios7以上已经摒弃的这个方法
//        }
//
//
//    }

    return size;
}

@end



@implementation NSString (File)

+ (NSString *)pathName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    return [documentsDirectory stringByAppendingPathComponent:@"menu.plist"];
}

@end
