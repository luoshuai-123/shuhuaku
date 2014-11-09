//
//  SHBaseNav.m
//  ShuHuaKu
//
//  Created by luoshuai on 14/10/21.
//  Copyright (c) 2014年 WS. All rights reserved.
//

#import "SHBaseNC.h"

@interface SHBaseNC ()

@end

@implementation SHBaseNC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setTranslucent:NO];
    [self.navigationBar setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
