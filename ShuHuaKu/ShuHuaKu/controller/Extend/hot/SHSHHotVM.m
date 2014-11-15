//
//  SHSHHotVM.m
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/9.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import "SHSHHotVM.h"

@implementation SHSHHotVM

#pragma mark - 加载轮播图
- (void)loadchangeImage{
    __weak typeof(self)weakSelf = self;
    [SHDataPort GET:URL_getChangeImg globalTimelinePostsWithBlock:^(NSDictionary *output, NSError *error) {
        
        if ([output[@"status"] intValue] == 200) {
                weakSelf.modelArray_changeImg = [output objectForKey:@"data"];
            if ([weakSelf.interface respondsToSelector:@selector(hotVMDelegateGetChangeImg_succeed)]) {
                [weakSelf.interface hotVMDelegateGetChangeImg_succeed];
            }
        }else{
            if ([weakSelf.interface respondsToSelector:@selector(hotVMDelegateGetChangeImg_failure)]) {
                [weakSelf.interface hotVMDelegateGetChangeImg_failure];
            }
        }
    }];
}
//    http://www.shuhuaku.com/shk-test/index.php?app=api&ac=found&ts=getArtsAuthorList&page=0&userid=0&recommend=1&verified=1
#pragma mark - 获取搜索/热门/艺术家列表
- (void)loadgetArtsAuthorListPage:(NSNumber *)page userid:(NSNumber *)userid isLonghair:(NSNumber *)isLonghair{
    NSString *url = @"";
    if ([isLonghair boolValue]) {
        url = [NSString stringWithFormat:@"%@&page=%@&Userid=%@&recommend=1&verified=1",URL_getArtsAuthorList,page,userid];
    }
    __weak typeof(self)weakSelf = self;
    [SHDataPort GET:url globalTimelinePostsWithBlock:^(NSDictionary *output, NSError *error) {
        if ([output[@"status"] intValue] == 200) {
            
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary *dic in [output objectForKey:@"data"]) {
                SHHotModel *model = [SHArtsAuthorListModel objectFromDictionary:dic];
                [array safeAddObject:model];
            }
            weakSelf.modelArray_artsAuthorList = array;

            if ([weakSelf.interface respondsToSelector:@selector(hotVMDelegateGetArtsAuthorList_succeed)]) {
                [weakSelf.interface hotVMDelegateGetArtsAuthorList_succeed];
            }
        }else{
            if ([weakSelf.interface respondsToSelector:@selector(hotVMDelegateGetArtsAuthorList_failure)]) {
                [weakSelf.interface hotVMDelegateGetArtsAuthorList_failure];
            }
        }
    }];
}



#pragma mark - 获取发现/热门/艺术品列表
- (void)loadgetArtsListPage:(NSNumber *)page userid:(NSNumber *)userid{
    
    NSString *url = [NSString stringWithFormat:@"%@&page=%@&Userid=%@",URL_getArtsList,page,userid];
    __weak typeof(self)weakSelf = self;
    [SHDataPort GET:url globalTimelinePostsWithBlock:^(NSDictionary *output, NSError *error) {
        if ([output[@"status"] intValue] == 200) {
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary *dic in [output objectForKey:@"data"]) {
                SHHotModel *model = [SHHotModel objectFromDictionary:dic];
                [array safeAddObject:model];
            }
                weakSelf.modelArray_artsList = array;
            if ([weakSelf.interface respondsToSelector:@selector(hotVMDelegateGetArtsList_succeed)]) {
                [weakSelf.interface hotVMDelegateGetArtsList_succeed];
            }
        }else{
            if ([weakSelf.interface respondsToSelector:@selector(hotVMDelegateGetArtsList_failure)]) {
                [weakSelf.interface hotVMDelegateGetArtsList_failure];
            }
        }
    }];
}

@end
