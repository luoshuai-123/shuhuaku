//
//  SHHomeVC.m
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/9.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import "SHHomeVC.h"
#import "SHShareVC.h"
@interface SHHomeVC ()

@end

@implementation SHHomeVC
- (instancetype)init{
    self = [super init];
    if (self) {
        self.parentTitle = @"书画酷";
    }
    return self;
}
#pragma mark - 处理通知
-(void)registerNotification{
    [self observeNotification:NOTIFY_shareTabbar];
}
#pragma mark - 通知回调
- (void)handleNotification:(NSNotification *)notification{
    if ([notification.name isEqualToString:NOTIFY_shareTabbar]) {
        [self pushShareVC];
    }
}
- (void)pushShareVC{
    SHShareVC *shareVC = [[SHShareVC alloc]init];
    [self.view.window.rootViewController presentViewController:shareVC animated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self registerNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
