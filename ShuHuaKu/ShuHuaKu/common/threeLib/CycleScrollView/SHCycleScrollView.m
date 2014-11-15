//
//  CycleScrollView.m
//  CycleScrollDemo
//
//  Created by Weever Lu on 12-6-14.
//  Copyright (c) 2012年 linkcity. All rights reserved.
//

#define timeInterval 3
#import "SHCycleScrollView.h"
@interface SHCycleScrollView()
@property (nonatomic, strong)NSTimer *timer;
@end
@implementation SHCyleImageView
- (NSString *)ID{
    if (!_ID) {
        return @"";
    }
    return _ID;
}
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setContentMode:UIViewContentModeScaleAspectFill];
        [self.layer setMasksToBounds:YES];
    }
    return self;
}
- (void)addShowImageData:(NSString *)url{
    [self setImageWithURLString:url placeholdImage:nil];
}
@end

@interface SHCycleScrollView()<UIScrollViewDelegate>{
    NSInteger totalPage;
    NSInteger curPage;
    CGRect scrollFrame;
}
@property (nonatomic, strong) UIScrollView   *scrollView;
@property (nonatomic, strong) UIImageView    *curImageView;
@property (nonatomic, strong) SMPageControl  *pageControl;
@property (nonatomic, strong) NSMutableArray *imagesArray;
@property (nonatomic, strong) NSMutableArray *curImages;
@end

@implementation SHCycleScrollView
@synthesize delegate;

- (NSMutableArray *)curImages{
    if (_curImages) {
        return _curImages;
    }
    _curImages = [[NSMutableArray alloc] init];
    return _curImages;
}

- (NSMutableArray *)imagesArray{
    if (_imagesArray) {
        return _imagesArray;
    }
    _imagesArray = [[NSMutableArray alloc] init];
    return _imagesArray;
}
- (UIScrollView *)scrollView{
    if (_scrollView) {
        return _scrollView;
    }
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(scrollFrame.size.width * 3,
                                             scrollFrame.size.height);
    return _scrollView;
}
- (SMPageControl *)pageControl{
    if (_pageControl) {
        return _pageControl;
    }
    _pageControl = [[SMPageControl alloc]initWithFrame:CGRectMake(0, self.scrollView.height - 20, 320, 20)];
    [_pageControl setPageIndicatorImage:GLOBALIMG.refreshLoadImgae];
    [_pageControl setCurrentPageIndicatorImage:GLOBALIMG.userbackground];
    return _pageControl;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        scrollFrame = frame;
        [self addSubview:self.scrollView];
        [self insertSubview:self.pageControl aboveSubview:self.scrollView];
        
    }
    
    return self;
}

- (void)updateView:(NSArray *)pictureArray{
    if (pictureArray && [pictureArray count] <= 0) {
        return;
    }
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    totalPage = [pictureArray count];
    curPage = 1; // 显示的是图片数组里的第一张图片
    
    if ([self.imagesArray count] > 0) {
        [self.imagesArray removeAllObjects];
    }
    [self.imagesArray addObjectsFromArray:pictureArray];
    self.pageControl.numberOfPages = totalPage;
    
    [self refreshScrollView];
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(timeOffSize) userInfo:nil repeats:YES];
    }
    
}
- (void)timeOffSize
{
    [self.scrollView setContentOffset:CGPointMake(640, 0) animated:YES];
}
- (void)refreshScrollView {
    
    NSArray *subViews = [self.scrollView subviews];
    if([subViews count] != 0) {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    [self getDisplayImagesWithCurpage:curPage];
    
    for (int i = 0; i < 3; i++) {
        
        SHCyleImageView *imageView = [[SHCyleImageView alloc] initWithFrame:self.bounds];
        [imageView addShowImageData:[self.curImages safeObjectAtIndex:i]];
        imageView.frame = CGRectOffset(imageView.frame, scrollFrame.size.width * i, 0);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [imageView addGestureRecognizer:tap];
        
        [self.scrollView addSubview:imageView];
    }
    [self.scrollView setContentOffset:CGPointMake(scrollFrame.size.width, 0)];
}

- (NSArray *)getDisplayImagesWithCurpage:(int)page {
    
    int pre = [self validPageValue:curPage-1];
    int last = [self validPageValue:curPage+1];
    
    if([self.curImages count] != 0) [self.curImages removeAllObjects];
    
    [self.curImages safeAddObject:[self.imagesArray safeObjectAtIndex:pre-1]];
    [self.curImages safeAddObject:[self.imagesArray safeObjectAtIndex:curPage-1]];
    [self.curImages safeAddObject:[self.imagesArray safeObjectAtIndex:last-1]];
    
    return self.curImages;
}

- (int)validPageValue:(NSInteger)value {
    
    if(value == 0) value = totalPage;                   // value＝1为第一张，value = 0为前面一张
    if(value == totalPage + 1) value = 1;
    
    return value;
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    
    int x = aScrollView.contentOffset.x;
    
    // 往下翻一张
    if(x >= ( 2 * scrollFrame.size.width)) {
        curPage = [self validPageValue:curPage+1];
        [self refreshScrollView];
    }
    if(x <= 0) {
        curPage = [self validPageValue:curPage-1];
        [self refreshScrollView];
    }
    
    if ([delegate respondsToSelector:@selector(cycleScrollViewDelegate:didScrollImageView:)]) {
        [delegate cycleScrollViewDelegate:self didScrollImageView:curPage];
    }
    
    self.pageControl.currentPage = curPage-1 ;
//    [pageControl updateCurrentPageDisplay] ;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView {    
    [self.scrollView setContentOffset:CGPointMake(scrollFrame.size.width, 0) animated:YES];
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(timeOffSize) userInfo:nil repeats:YES];
    }
}
- (void)handleTap:(UITapGestureRecognizer *)tap {
    if ([delegate respondsToSelector:@selector(cycleScrollViewDelegate:didSelectImageView:)]) {
        [delegate cycleScrollViewDelegate:self didSelectImageView:(SHCyleImageView *)tap.view];
    }
}
@end
