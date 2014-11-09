//
//  SHBaseTB.m
//  ShuHuaKu
//
//  Created by luoshuai on 14/10/22.
//  Copyright (c) 2014年 WS. All rights reserved.
//

#import "SHBaseTB.h"
#import "SHHomeVC.h"
#import "SHHotVC.h"
#import "SHShareVC.h"
#import "SHFindVC.h"
#import "SHMeVC.h"
@interface SHBaseTB ()

@end

@implementation SHBaseTB
+ (SHBaseTB *)creat{
    NSArray * vcArray  = [self initControllers];
    NSMutableArray * tabimgArray = [[NSMutableArray alloc]init];
    [tabimgArray safeAddObject:@{@"Default":GLOBALIMG.ic_bottom_home,
                                 @"Highlighted":GLOBALIMG.ic_bottom_home_select,
                                 @"title":@"首页"}];
    [tabimgArray safeAddObject:@{@"Default":GLOBALIMG.ic_bottom_hot,
                                 @"Highlighted":GLOBALIMG.ic_bottom_hot_select,
                                 @"title":@"热门"}];
    [tabimgArray safeAddObject:@{@"Default":GLOBALIMG.ic_bottom_share,
                                 @"Highlighted":GLOBALIMG.ic_bottom_share,
                                 @"title":@""}];
    [tabimgArray safeAddObject:@{@"Default":GLOBALIMG.ic_bottom_find,
                                 @"Highlighted":GLOBALIMG.ic_bottom_find_select,
                                 @"title":@"发现"}];
    [tabimgArray safeAddObject:@{@"Default":GLOBALIMG.ic_bottom_mine,
                                 @"Highlighted":GLOBALIMG.ic_bottom_mine_select,
                                 @"title":@"我"}];
    SHBaseTB * home = [[self alloc]initWithViewControllers:vcArray imageArray:tabimgArray];
    return home;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


/**********************************************************
 函数描述：初始化tabbarcontroller
 输入参数：无
 输出参数：无
 返回值：无
 **********************************************************/

+ (NSArray*)initControllers{
    SHHomeVC *homeVC = [[SHHomeVC alloc]init];
    SHBaseNC *nav1 = [[SHBaseNC alloc]initWithRootViewController:homeVC];
    
    SHHotVC *hotVC = [[SHHotVC alloc]init];
    SHBaseNC *nav2 = [[SHBaseNC alloc]initWithRootViewController:hotVC];
    
    SHShareVC *addVC = [[SHShareVC alloc]init];
    SHBaseNC *nav3 = [[SHBaseNC alloc]initWithRootViewController:addVC];
    
    SHFindVC *findVC = [[SHFindVC alloc]init];
    SHBaseNC *nav4 = [[SHBaseNC alloc]initWithRootViewController:findVC];
    
    SHMeVC *meVC = [[SHMeVC alloc]init];
    SHBaseNC *nav5 = [[SHBaseNC alloc]initWithRootViewController:meVC];
    return @[nav1,nav2,nav3,nav4,nav5];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
