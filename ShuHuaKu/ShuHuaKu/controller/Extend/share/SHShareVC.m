//
//  SHAddVC.m
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/9.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import "SHShareVC.h"

@interface SHShareVC ()
@property (nonatomic, strong) UIButton *dismissButton;
@end

@implementation SHShareVC
- (UIButton *)dismissButton{
    if (_dismissButton) {
        return _dismissButton;
    }
    _dismissButton = [UIButton buttonWithType:0];
    [_dismissButton setImage:GLOBALIMG.ic_bottom_share_select forState:UIControlStateNormal];
    [_dismissButton addTarget:self action:@selector(dismissClick) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    return _dismissButton;
}
- (void)dismissClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)_setup{
    [self.view addSubview:self.dismissButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self _setup];
    [self autolayouUI];
}
- (void)autolayouUI{
    NSDictionary *dict1 = NSDictionaryOfVariableBindings(_dismissButton);
    NSString *vfl = @"H:|-[_dismissButton]-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:nil views:dict1]];
    
    NSString *vfl1 = @"V:|-400-[_dismissButton]-0-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl1 options:0 metrics:nil views:dict1]];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
