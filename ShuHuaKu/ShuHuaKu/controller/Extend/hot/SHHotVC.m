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
#import "SHSHHotVM.h"
#import "SHHotView.h"
@interface SHHotVC ()<UITableViewDataSource,UITableViewDelegate,SHSHHotVMInterface>
@property (nonatomic, strong) UITableView *hotListView;
@property (nonatomic, strong) SHCycleScrollView *cycleScroller;
@property (nonatomic, strong) SHSHHotVM *viewModel;
@property (nonatomic, strong) SHHotArtsListView *artslistView;
@property (nonatomic, strong) SHHotArtsAuthorListView *artsAuthorListView;
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
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 10)];
    [view setBackgroundColor:[UIColor clearColor]];
    [_hotListView setTableFooterView:view];
    
    
    return _hotListView;
}
- (SHHotArtsListView *)artslistView{
    if (_artslistView) {
        return _artslistView;
    }
    _artslistView = [[SHHotArtsListView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 172)];
    return _artslistView;
}
- (SHHotArtsAuthorListView *)artsAuthorListView{
    if (_artsAuthorListView) {
        return _artsAuthorListView;
    }
    _artsAuthorListView = [[SHHotArtsAuthorListView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
    return _artsAuthorListView;
}
- (SHCycleScrollView *)cycleScroller{
    if (_cycleScroller) {
        return _cycleScroller;
    }
    _cycleScroller = [[SHCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 150)];
    return _cycleScroller;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        self.parentTitle = @"热门";
    }
    return self;
}


- (void)_setup{
    [self.view addSubview:self.hotListView];
    [self.hotListView setTableHeaderView:self.cycleScroller];
}
- (void)initViewModel{
    self.viewModel = [SHSHHotVM new];
    [self.viewModel setInterface:self];
    [self.viewModel loadchangeImage];
    [self.viewModel loadgetArtsListPage:@0 userid:@0];
    [self.viewModel loadgetArtsAuthorListPage:@0 userid:@0 isLonghair:@YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setup];
    [self initViewModel];
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
    if (indexPath.section == 0) {
        [cell.contentView addSubview:self.artsAuthorListView];
    }
    if (indexPath.section == 1) {
        [cell.contentView addSubview:self.artslistView];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return [self.artsAuthorListView sizeHot].height;
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        return [self.artslistView sizeHot].height;
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, view.height)];
    [label addalignment:NSTextAlignmentLeft backgroundColor:[UIColor clearColor] titleColor:[UIColor blackColor] labelTag:100+section font:font(14)];
    [label setText:section==0 ? @"热门艺术家:":@"热门艺术品:"];
    
    UIButton *btn = [UIButton buttonWithType:0];
    [btn setFrame:CGRectMake(self.view.width - 100, 0, 100, 40)];
    [btn setTitle:@"显示更多>" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.titleLabel.font = font(14);
    [btn setTag:section];
    
    [view addSubview:label];
    [view addSubview:btn];
    
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



#pragma mark - 加载轮播图
- (void)hotVMDelegateGetChangeImg_succeed{
    [self.cycleScroller updateView:self.viewModel.modelArray_changeImg];

}//成功

- (void)hotVMDelegateGetChangeImg_failure{
    
}//失败

#pragma mark - 获取发现/热门/艺术品列表
- (void)hotVMDelegateGetArtsList_succeed{
    [self.artslistView showUI:self.viewModel.modelArray_artsList];
    
}//成功
- (void)hotVMDelegateGetArtsList_failure{
    
}//失败



#pragma mark - 获取搜索/热门/艺术家列表
- (void)hotVMDelegateGetArtsAuthorList_succeed{
    [self.artsAuthorListView showUI:self.viewModel.modelArray_artsAuthorList];
}//成功


- (void)hotVMDelegateGetArtsAuthorList_failure{
    
}//失败






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
