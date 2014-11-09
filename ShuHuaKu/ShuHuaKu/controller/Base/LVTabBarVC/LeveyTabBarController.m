//
//  LeveyTabBarControllerViewController.m
//  LeveyTabBarController
//
//  Created by Levey Zhu on 12/15/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import "LeveyTabBarController.h"
#import "LeveyTabBar.h"
#define kTabBarHeight 50.0f

static LeveyTabBarController *leveyTabBarController;

@implementation UIViewController (LeveyTabBarControllerSupport)

- (LeveyTabBarController *)leveyTabBarController
{
	return leveyTabBarController;
}

@end

@interface LeveyTabBarController (private)
- (void)displayViewAtIndex:(NSUInteger)index;
@end

@implementation LeveyTabBarController
@synthesize delegate = _delegate;
@synthesize selectedViewController = _selectedViewController;
@synthesize viewControllers = _viewControllers;
@synthesize selectedIndex = _selectedIndex;
@synthesize tabBarHidden = _tabBarHidden;

#pragma mark -
#pragma mark lifecycle
- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr;
{
	self = [super init];
	if (self != nil)
	{
		_viewControllers = [[NSMutableArray arrayWithArray:vcs] retain];
		

        _containerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
		
		_transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [SYSTEMVALUE.screenWidth floatValue], _containerView.frame.size.height - kTabBarHeight)];
		_transitionView.backgroundColor =  [UIColor groupTableViewBackgroundColor];
		
		_tabBar = [[LeveyTabBar alloc] initWithFrame:CGRectMake(0, _containerView.frame.size.height - kTabBarHeight, [SYSTEMVALUE.screenWidth floatValue], kTabBarHeight) buttonImages:arr];
		_tabBar.delegate = self;
		
        leveyTabBarController = self;
        self.tabBarHidden = NO;
	}
	return self;
}

- (void)loadView 
{
	[super loadView];
	
	[_containerView addSubview:_transitionView];
	[_containerView addSubview:_tabBar];
	self.view = _containerView;
}
- (void)viewDidLoad 
{
    [super viewDidLoad];
	
    self.selectedIndex = 0;
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	
	_tabBar = nil;
	_viewControllers = nil;
}


- (void)dealloc 
{
    _tabBar.delegate = nil;
	[_tabBar release];
    [_containerView release];
    [_transitionView release];
	[_viewControllers release];
    [super dealloc];
}

#pragma mark - instant methods

- (LeveyTabBar *)tabBar
{
	return _tabBar;
}
- (BOOL)tabBarTransparent
{
	return _tabBarTransparent;
}
- (void)setTabBarTransparent:(BOOL)yesOrNo
{
	if (yesOrNo == YES)
	{
		_transitionView.frame = _containerView.bounds;
	}
	else
	{
		_transitionView.frame = CGRectMake(0, 0, [SYSTEMVALUE.screenWidth floatValue], _containerView.frame.size.height - kTabBarHeight);
	}

}
- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
{
    if (yesOrNO == self.tabBarHidden) {
        return;
    }
    
    self.tabBarHidden = yesOrNO;
	
	if (animated == YES)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.3f];
		if (yesOrNO == YES)
		{
            self.tabBar.transform = CGAffineTransformMakeTranslation(0, kTabBarHeight);
		}
		else 
		{
            self.tabBar.transform = CGAffineTransformMakeTranslation(0, 0);
		}
		[UIView commitAnimations];
	}
	else 
	{
		if (yesOrNO == YES)
		{
            self.tabBar.transform = CGAffineTransformMakeTranslation(0, kTabBarHeight);
		}
		else 
		{
            self.tabBar.transform = CGAffineTransformMakeTranslation(0, 0);
		}
	}
}

- (NSUInteger)selectedIndex
{
	return _selectedIndex;
}
- (UIViewController *)selectedViewController
{
    return [_viewControllers objectAtIndex:_selectedIndex];
}

-(void)setSelectedIndex:(NSUInteger)index
{
    [self displayViewAtIndex:index];
    [_tabBar selectTabAtIndex:index];
}

- (void)removeViewControllerAtIndex:(NSUInteger)index
{
    if (index >= [_viewControllers count])
    {
        return;
    }
    // Remove view from superview.
    [[(UIViewController *)[_viewControllers objectAtIndex:index] view] removeFromSuperview];
    // Remove viewcontroller in array.
    [_viewControllers removeObjectAtIndex:index];
    // Remove tab from tabbar.
    [_tabBar removeTabAtIndex:index];
}

- (void)insertViewController:(UIViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    [_viewControllers insertObject:vc atIndex:index];
}


#pragma mark - Private methods
- (void)displayViewAtIndex:(NSUInteger)index
{
    if (index == 2) {
        [self postNotification:NOTIFY_shareTabbar];
        return;
    }
    
    // Before changing index, ask the delegate should change the index.
    if ([_delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)])
    {
        if (![_delegate tabBarController:self shouldSelectViewController:[self.viewControllers objectAtIndex:index]])
        {
            return;
        }
    }
    
    UIViewController *targetViewController = [self.viewControllers objectAtIndex:index];

    // If target index is equal to current index.
    if (_selectedIndex == index && [[_transitionView subviews] count] != 0) 
    {
        if ([_delegate respondsToSelector:@selector(tabBarController:refrshSelectIndex:)]) {
            [_delegate tabBarController:self refrshSelectIndex:_selectedIndex];
        }

        if ([targetViewController isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController*)targetViewController popToRootViewControllerAnimated:YES];
        }
        return;
    }

    _selectedIndex = index;
    
	[_transitionView.subviews makeObjectsPerformSelector:@selector(setHidden:) withObject:(id)YES];
    targetViewController.view.hidden = NO;
	targetViewController.view.frame = _transitionView.frame;
	if ([targetViewController.view isDescendantOfView:_transitionView]) 
	{
		[_transitionView bringSubviewToFront:targetViewController.view];
	}
	else
	{
		[_transitionView addSubview:targetViewController.view];
	}
    
    // Notify the delegate, the viewcontroller has been changed.
    if ([_delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) 
    {
        [_delegate tabBarController:self didSelectViewController:targetViewController];
    }
}

#pragma mark -
#pragma mark tabBar delegates
- (void)tabBar:(LeveyTabBar *)tabBar didSelectIndex:(NSInteger)index
{
	[self displayViewAtIndex:index];
}
@end
