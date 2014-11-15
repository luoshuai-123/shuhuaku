//
//  SHHotView.m
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/15.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import "SHHotView.h"
#import "SHHotModel.h"
@implementation SHHotView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}
@end



@interface SHHotArtsListView (){
    
}
@property (nonatomic, strong) UIScrollView *backGroundScrollView;
@property (nonatomic, assign) CGFloat spacing;
@end
@implementation SHHotArtsListView
- (UIScrollView *)backGroundScrollView{
    if (_backGroundScrollView) {
        return _backGroundScrollView;
    }
    _backGroundScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    return _backGroundScrollView;
}

- (void)_setup{
    [self addSubview:self.backGroundScrollView];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.spacing = 5.;
        [self _setup];
    }
    return self;
}

- (void)showUI:(NSArray *)arrayModel{
    if (!arrayModel) {
        return;
    }
    [self.backGroundScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger i = 0;
    for (SHHotModel *model in arrayModel) {
        
        UIButton *viewButton = [[UIButton alloc]initWithFrame:CGRectMake(self.spacing + (139 + self.spacing) * i, 0, 139, self.height)];
        [viewButton setTag:[model.userid intValue]];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 139, 139)];
        [imageView setImageWithURLString:[model.imgPath safeObjectAtIndex:0] placeholdImage:nil];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, viewButton.bottom - 30, viewButton.width, 30)];
        [label addalignment:NSTextAlignmentCenter
            backgroundColor:[UIColor clearColor]
                 titleColor:[UIColor blackColor]
                   labelTag:100*i
                       font:font(13)];
        [label setText:model.username];
        
        [viewButton addSubview:imageView];
        [viewButton addSubview:label];
        [self.backGroundScrollView addSubview:viewButton];
        if ([arrayModel count]-1 == i) {
            [self.backGroundScrollView setContentSize:CGSizeMake(viewButton.right+self.spacing, viewButton.height)];
        }
        i++;
    }
    
    
    
}








- (CGSize)sizeHot{
    return self.frame.size;
}
@end





@interface SHHotArtsAuthorListView (){
    
}
@property (nonatomic, strong) UIScrollView *backGroundScrollView;
@property (nonatomic, assign) CGFloat spacing;
@end
@implementation SHHotArtsAuthorListView

- (UIScrollView *)backGroundScrollView{
    if (_backGroundScrollView) {
        return _backGroundScrollView;
    }
    _backGroundScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    return _backGroundScrollView;
}

- (void)_setup{
    [self addSubview:self.backGroundScrollView];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.spacing = 0.;
        [self _setup];
    }
    return self;
}

- (void)showUI:(NSArray *)arrayModel{
    if (!arrayModel) {
        return;
    }
    [self.backGroundScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger i = 0;
    for (SHArtsAuthorListModel *model in arrayModel) {
        
        UIButton *viewButton = [[UIButton alloc]initWithFrame:CGRectMake(5 + (100 + self.spacing) * i, 0, 100, self.height)];
        [viewButton setTag:[model.userid intValue]];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((viewButton.width-65)/2, 0, 65, 65)];
        [imageView setImageWithURLString:model.avatar placeholdImage:nil];
        [imageView.layer setCornerRadius:imageView.width/2];
        [imageView.layer setMasksToBounds:YES];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, viewButton.bottom - 30, viewButton.width, 30)];
        [label addalignment:NSTextAlignmentCenter
            backgroundColor:[UIColor clearColor]
                 titleColor:[UIColor blackColor]
                   labelTag:100*i
                       font:font(13)];
        [label setText:model.username];
        
        [viewButton addSubview:imageView];
        [viewButton addSubview:label];
        [self.backGroundScrollView addSubview:viewButton];
        if ([arrayModel count]-1 == i) {
            [self.backGroundScrollView setContentSize:CGSizeMake(viewButton.right+5, viewButton.height)];
        }
        i++;
    }
    
    
    
}



- (CGSize)sizeHot{
    return self.frame.size;
}
@end






