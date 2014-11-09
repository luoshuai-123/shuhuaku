//
//  SHHotVC.m
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/9.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import "SHHotVC.h"
#import "SHDataPort.h"
#import "SHCycleScrollView.h"
@interface SHHotVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *hotListView;
@property (nonatomic, strong) SHCycleScrollView *cycleScroller;
@end

@implementation SHHotVC
- (UITableView *)hotListView{
    if (_hotListView) {
        return _hotListView;
    }
    _hotListView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_hotListView setDelegate:self];
    [_hotListView setDataSource:self];
    [_hotListView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [_hotListView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    return _hotListView;
}
- (SHCycleScrollView *)cycleScroller{
    if (_cycleScroller) {
        return _cycleScroller;
    }
    return _cycleScroller;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        self.parentTitle = @"热门";
    }
    return self;
}
- (void)loadchangeImage{
    [SHDataPort GET:URL_getChangeImg globalTimelinePostsWithBlock:^(NSDictionary *output, NSError *error) {
        
    }];
    
}
- (void)_setup{
    [self.view addSubview:self.hotListView];
    [self.hotListView setTableHeaderView:self.cycleScroller];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadchangeImage];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 4) {
        return 150;
    }
    return 50;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
