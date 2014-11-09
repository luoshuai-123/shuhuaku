//
//  SHBaseVC.m
//  ShuHuaKu
//
//  Created by luoshuai on 14/10/21.
//  Copyright (c) 2014年 WS. All rights reserved.
//

#import "SHBaseVC.h"

@interface SHBaseVC ()
@property (nonatomic, strong) UILabel *parentTitileLabel;//标题

@end

@implementation SHBaseVC

- (void)setParentTitle:(NSString *)parentTitle{
    _parentTitle = parentTitle;
    if (!self.parentTitileLabel) {
        self.parentTitileLabel = [[UILabel alloc]initWithFrame:self.parentNavView.bounds];
        [self.parentTitileLabel setTextAlignment:NSTextAlignmentCenter];
        [self.parentTitileLabel setBackgroundColor:[UIColor clearColor]];
        [self.parentTitileLabel setTextColor:[UIColor whiteColor]];
        [self.parentTitileLabel setFont:font_B(20)];
        [self.parentNavView addSubview:self.parentTitileLabel];
    }
    [self.parentTitileLabel setText:parentTitle];
    
}
- (UIView *)parentNavView{
    if (_parentNavView) {
        return _parentNavView;
    }
    _parentNavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    [_parentNavView setBackgroundColor:[UIColor clearColor]];
    return _parentNavView;
}
- (UIView *)leftItemView{
    if (_leftItemView) {
        return _leftItemView;
    }
    _leftItemView = [[UIView alloc]initWithFrame:CGRectZero];
    return _leftItemView;
}
- (UIView *)rigthItemView{
    if (_rigthItemView) {
        return _rigthItemView;
    }
    _rigthItemView = [[UIView alloc]initWithFrame:CGRectZero];
    return _rigthItemView;
}

- (void)addButtonReturn:(SEL)buttonClicked leftImage:(id)image pressImage:(UIImage *)pressImage{
    UIButton *returnbutton = nil;
    UIImage *leftimage = nil;

    if ([image isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)image;
        CGSize size = [str getUISize:font(14) limitWidth:100];
        returnbutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0.f, size.width, size.height)];
        [returnbutton setTitle:str forState:UIControlStateNormal];
        [returnbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [returnbutton.titleLabel setFont:font(14)];
    }else{
        leftimage = (UIImage *)image;
        returnbutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0.f, leftimage.size.width, leftimage.size.height)];
        [returnbutton setImage:image forState:UIControlStateNormal];
        [returnbutton setImage:pressImage forState:UIControlStateHighlighted];
    }
    [returnbutton addTarget:self action:buttonClicked forControlEvents:UIControlEventTouchUpInside];
    [self.leftItemView setFrame:returnbutton.frame];
    [self.leftItemView addSubview:returnbutton];

}
- (void)addLeftItemView:(UIView *)leftView{
    if (leftView) {
        [self.leftItemView setFrame:leftView.frame];
        [self.leftItemView addSubview:leftView];
    }
}
- (void)addRightButton:(SEL)buttonClicked rightImage:(id)image  pressImage:(UIImage *)pressImage{
    
    UIButton *rigthButton = nil;
    UIImage *rightimage = nil;
    if ([image isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)image;
        CGSize size = [str getUISize:font(14) limitWidth:100];
        rigthButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0.f, size.width, size.height)];
        [rigthButton setTitle:str forState:UIControlStateNormal];
        [rigthButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [rigthButton.titleLabel setFont:font(14)];
    }else{
        rightimage = (UIImage *)image;
        rigthButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0.f, rightimage.size.width, rightimage.size.height)];
        [rigthButton setImage:image forState:UIControlStateNormal];
        [rigthButton setImage:pressImage forState:UIControlStateHighlighted];
    }
    [rigthButton addTarget:self action:buttonClicked forControlEvents:UIControlEventTouchUpInside];
    [self.rigthItemView setFrame:rigthButton.frame];
    [self.rigthItemView addSubview:rigthButton];
    
}

- (void)addRightItemView:(UIView *)rightView{
    if (rightView) {
        [self.rigthItemView setFrame:rightView.frame];
        [self.rigthItemView addSubview:rightView];
    }
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if([SYSTEMVALUE.systemVersion floatValue] >= 7.) {
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.extendedLayoutIncludesOpaqueBars = NO;
            self.modalPresentationCapturesStatusBarAppearance = NO;
            
        }
        
        //        self.navigationItem.hidesBackButton = YES;
        [self.navigationItem setTitleView:self.parentNavView];
        UIBarButtonItem *itemBar = [[UIBarButtonItem alloc]initWithCustomView:self.leftItemView];
        [self.navigationItem setLeftBarButtonItem:itemBar];
        UIBarButtonItem *itemBarB = [[UIBarButtonItem alloc]initWithCustomView:self.rigthItemView];
        [self.navigationItem setRightBarButtonItem:itemBarB];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (SHBaseNC *)navigationControllerView:(UIViewController *)controller{
    SHBaseNC *nav = [[SHBaseNC alloc]initWithRootViewController:controller];
    return nav;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [self unobserveAllNotifications];
    NSLog(@"\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n"
          "     %@   ------->   dealloc                  \n"
          "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n",[self class]);
}
@end
