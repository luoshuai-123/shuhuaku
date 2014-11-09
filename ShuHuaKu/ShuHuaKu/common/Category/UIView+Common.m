//
//  UIView+Common.m
//  Juanpi_2.0
//
//  Created by lee on 14-2-18.
//  Copyright (c) 2014年 Juanpi. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Common)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)left {
    return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)top {
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerX {
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerY {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)width {
    return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)height {
    return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

/**
 
 父视图居中
 
 **/

-(void)makeCenter{
    if (!self.superview) {
        return;
    }
    CGRect selfrect = self.frame;
    selfrect.origin.x = self.superview.width/2 - self.width/2;
    selfrect.origin.y = self.superview.height/2 - self.height/2;
    self.frame = selfrect;
}

/**
 
 横向居中
 
 **/

/**
 
 纵向居中
 
 **/


- (void)addRadius
{
//    [self.layer setCornerRadius:[GLOBALVALUE.radiusFl floatValue]];
//    [self.layer setMasksToBounds:YES];
}
-(void)addBrderWidth
{
    [self.layer setBorderWidth:1.];
    [self.layer setBorderColor:[UIColor colorWithWhite:.5 alpha:1.].CGColor];
    [self addRadius];
}
/**
 *  半圆
 */
- (void)addSemicircle{
    [self.layer setCornerRadius:self.width/2];
    [self.layer setMasksToBounds:YES];
}

- (void)shakeView
{
    [self _shake:10 direction:1 currentTimes:0 withDelta:5 andSpeed:0.03];
}
- (void)_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval
{
	[UIView animateWithDuration:interval animations:^{
		self.transform = CGAffineTransformMakeTranslation(delta * direction, 0);
	} completion:^(BOOL finished) {
		if(current >= times) {
			self.transform = CGAffineTransformIdentity;
			return;
		}
		[self _shake:(times - 1)
		   direction:direction * -1
		currentTimes:current + 1
		   withDelta:delta
			andSpeed:interval];
	}];
}


- (void)showAnimation
{
    
    [UIView animateWithDuration:0.2 animations:
     ^(void){
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.9f, 0.9f);
         self.alpha = 0.8;
     }
                     completion:^(BOOL finished){
                         [self bounceOutAnimationStoped];
                     }];
}
- (void)bounceOutAnimationStoped
{
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity,1., 1.);
         self.alpha = 1.;
     }
                     completion:^(BOOL finished){
                         //                         [self bounceInAnimationStoped];
                     }];
}
- (void)bounceInAnimationStoped
{
    [UIView animateWithDuration:0.07 animations:
     ^(void){
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity,1, 1);
         self.alpha = 1.0;
     }
                     completion:^(BOOL finished){
                     }];
}
- (void)hideView
{
    self.alpha = 0;
    self.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.6, 0.6);
}

+(UIView *)lineView:(CGRect )rect{
    UIView *line = [[UIView alloc]initWithFrame:rect];
    return line;
}
@end
