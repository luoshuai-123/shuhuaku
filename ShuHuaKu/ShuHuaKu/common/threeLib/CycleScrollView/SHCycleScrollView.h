//
//  CycleScrollView.h
//  CycleScrollDemo
//
//  Created by Weever Lu on 12-6-14.
//  Copyright (c) 2012年 linkcity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMPageControl.h"

@protocol SHCycleScrollViewDelegate;
@interface SHCyleImageView : UIImageView
@property (nonatomic, strong)NSString *ID;
@end




@interface SHCycleScrollView : UIView

@property (nonatomic, assign) id <SHCycleScrollViewDelegate>delegate;
/**
 *  更新
 *
 *  @param pictureArray 图片数组
 */
- (void)updateView:(NSArray *)pictureArray;
/**
 *  轮播
 */
- (void)timeOffSize;
@end

@protocol SHCycleScrollViewDelegate <NSObject>
@optional
- (void)cycleScrollViewDelegate:(SHCycleScrollView *)cycleScrollView didSelectImageView:(SHCyleImageView *)imageView;
- (void)cycleScrollViewDelegate:(SHCycleScrollView *)cycleScrollView didScrollImageView:(int)index;

@end