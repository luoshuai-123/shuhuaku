//
//  UILabel+QMTitle.m
//  Jiukuaiyou_2.0
//
//  Created by Brick on 14-4-18.
//  Copyright (c) 2014年 QM. All rights reserved.
//

#import <CoreText/CoreText.h>
#import <objc/runtime.h>

static char kQM_StaticView;

@interface UILabel (_QMTitle)
@property (readwrite, nonatomic, strong, setter = qm_setStaticview:) UIView * qm_staticview;
@end

@implementation UILabel (_QMTitle)

-(UIView*)qm_staticview{
    return (UIView*)objc_getAssociatedObject(self, &kQM_StaticView);
}

-(void)qm_setStaticview:(UIView*)qm_staticview{
    objc_setAssociatedObject(self, &kQM_StaticView, qm_staticview, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UILabel (QMTitle)


-(void)alignToTop{
    if (!self.qm_staticview) {
        self.qm_staticview = [[UIView alloc]initWithFrame:self.frame];
    }
    
    
    self.frame = self.qm_staticview.frame;
    CGRect rect = [self textRectForBounds:self.bounds  limitedToNumberOfLines:self.numberOfLines];
    
    CGRect selfTitleRect = self.frame;
    selfTitleRect.size = rect.size;
    self.frame = selfTitleRect;
}


- (void)addWithContinuousRegistrationArray:(NSArray *)dic{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]init];
    if (dic) {
        [dic enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:obj[@"conten"]];
            NSRange range = NSMakeRange(0, str.length);
            [str addAttribute:NSForegroundColorAttributeName value:obj[@"color"] range:range];
            [str addAttribute:NSFontAttributeName value:obj[@"font"] range:range];
            
            NSNumber *isDel = obj[@"isDel"];
            if (isDel) {
                NSNumber *value;
                if ([SYSTEMVALUE.systemVersion floatValue] < 7.f) {
                    value = [NSNumber numberWithInteger:NSUnderlinePatternSolid | NSUnderlineStyleSingle];
                }else{
                    value = [NSNumber numberWithInteger:NSUnderlinePatternSolid | NSUnderlineStyleThick];
                }
                [str addAttribute:NSStrikethroughStyleAttributeName
                                  value:value
                                  range:range];
            }
            
            [attString appendAttributedString:str];
            
            if ([dic count]-1 == idx) {
                self.attributedText = attString;
            }
        }];
    }
    
}

- (CGSize)getSize{
    return [self.text getUISize:self.font limitWidth:self.width];
}


- (void)addalignment:(NSTextAlignment)alignment backgroundColor:(UIColor*)color titleColor:(UIColor*)titleColor labelTag:(int)tag font:(UIFont *)fontSize
{
    self.textAlignment = alignment;
    self.backgroundColor = color;
    self.textColor = titleColor;
    self.font = fontSize;
    self.tag = tag;
    
}
@end
















