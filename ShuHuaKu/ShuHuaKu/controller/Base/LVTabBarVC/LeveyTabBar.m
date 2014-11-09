//
//  LeveyTabBar.m
//  LeveyTabBarController
//
//  Created by Levey Zhu on 12/15/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import "LeveyTabBar.h"
@interface LeveyTabBar()

@property (atomic ,strong)NSArray *model;
@end
@interface QMIconButton ()
@property (nonatomic, strong) UILabel *labelLabel;
@property (nonatomic, strong) UIImageView *icon;
- (id)initWithFrame:(CGRect)frame buttonImages:(NSDictionary *)modes index:(NSInteger)index;

@end
@implementation QMIconButton
- (void)dealloc{
    [super dealloc];
    [self.labelLabel release];
    [self.icon release];
}
- (UIImageView *)icon{
    if (_icon) {
        return _icon;
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.width - 26)/2, 6, 26, 26)];
    _icon = imageView;
    return _icon;
}

- (UILabel *)labelLabel{
    if (_labelLabel) {
        return _labelLabel;
    }
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bottom -  20, self.width, 20)];
    [label addalignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor] titleColor:[UIColor grayColor] labelTag:200 font:font(11)];
    [label setUserInteractionEnabled:NO];
    _labelLabel = label;
    return _labelLabel;
    
}
- (id)initWithFrame:(CGRect)frame buttonImages:(NSDictionary *)modes index:(NSInteger)index{
    self = [super initWithFrame:frame];
    if (self) {
        self.tag = index;
        self.showsTouchWhenHighlighted = YES;
        [self.labelLabel setText:[modes objectForKey:@"title"]];
        [self addSubview:self.labelLabel];
        
        [self.icon setImage:[modes objectForKey:@"Default"]];
        [self addSubview:self.icon];
        
        if (index == 2) {
            [self.labelLabel setHidden:YES];
            [self.icon setFrame:CGRectMake((self.width - 40)/2, 6, 40, 40)];
            [self.icon setImage:[modes objectForKey:@"Highlighted"]];
        }
    }
    return self;
}
@end

@implementation LeveyTabBar
@synthesize backgroundView = _backgroundView;
@synthesize delegate = _delegate;
@synthesize buttons = _buttons;

- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray
{
    self = [super initWithFrame:frame];
    if (self)
	{
        self.model = imageArray;
        
		self.backgroundColor = [UIColor clearColor];
		_backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        [_backgroundView setUserInteractionEnabled:YES];
		[self addSubview:_backgroundView];
        
		self.buttons = [NSMutableArray arrayWithCapacity:[imageArray count]];
		QMIconButton *btn;
        UIView *backView = nil;
		CGFloat width = 320.0f / [imageArray count];
		for (int i = 0; i < [imageArray count]; i++)
		{
            NSDictionary *dic = [imageArray safeObjectAtIndex:i];
            backView = [[UIView alloc]initWithFrame:CGRectMake(width * i, 0, width, frame.size.height)];
            [backView setBackgroundColor:[UIColor clearColor]];
            
			btn = [[QMIconButton alloc]initWithFrame:CGRectMake(0, 0, backView.width, backView.height) buttonImages:dic index:i];
			[btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:backView];
			[backView addSubview:btn];
            [self.buttons addObject:btn];
		}
    }
    return self;
}

- (void)setBackgroundImage:(UIImage *)img
{
	[_backgroundView setImage:img];
}

- (void)tabBarButtonClicked:(id)sender
{
	UIButton *btn = sender;
	[self selectTabAtIndex:btn.tag];
}

- (void)selectTabAtIndex:(NSInteger)index
{
    if (index != 2) {
        int i = 0;
        for (QMIconButton *btn in self.buttons) {
            
            [btn.icon setImage:[[self.model safeObjectAtIndex:i] objectForKey:@"Default"]];
            [btn.labelLabel setTextColor:[UIColor grayColor]];
            
            if (i == index) {
                [btn.icon setImage:[[self.model safeObjectAtIndex:i] objectForKey:@"Highlighted"]];
                [btn.labelLabel setTextColor:[UIColor blackColor]];
            }
            
            i++;
        }
    }
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)])
    {
        [_delegate tabBar:self didSelectIndex:index];
    }
}

- (void)removeTabAtIndex:(NSInteger)index
{
    // Remove button
    [(UIButton *)[self.buttons objectAtIndex:index] removeFromSuperview];
    [self.buttons removeObjectAtIndex:index];
    
    // Re-index the buttons
    CGFloat width = [SYSTEMVALUE.screenWidth floatValue] / [self.buttons count];
    for (UIButton *btn in self.buttons)
    {
        if (btn.tag > index)
        {
            btn.tag --;
        }
        btn.frame = CGRectMake(width * btn.tag, 0, width, self.frame.size.height);
    }
}


- (void)dealloc
{
    [_backgroundView release];
    [_buttons release];
    [super dealloc];
}

@end
