//
//  SHSHHotVM.h
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/9.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHHotModel.h"
#import "SHDataPort.h"
@protocol SHSHHotVMInterface;
@interface SHSHHotVM : NSObject
@property (nonatomic, strong) NSArray *modelArray_changeImg;
@property (nonatomic, strong) NSArray *modelArray_artsList;
@property (nonatomic, strong) NSArray *modelArray_artsAuthorList;

@property (nonatomic, weak) id<SHSHHotVMInterface>interface;
- (void)loadchangeImage;
- (void)loadgetArtsListPage:(NSNumber *)page userid:(NSNumber *)userid;
/**
 *  艺术家列表
 *
 *  @param page       页码  默认是0
 *  @param userid     userid
 *  @param isLonghair 是否是热门艺术家
 */
- (void)loadgetArtsAuthorListPage:(NSNumber *)page userid:(NSNumber *)userid isLonghair:(NSNumber *)isLonghair;

@end


@protocol SHSHHotVMInterface <NSObject>
#pragma mark - 加载轮播图
- (void)hotVMDelegateGetChangeImg_succeed;//成功
- (void)hotVMDelegateGetChangeImg_failure;//失败

#pragma mark - 获取发现/热门/艺术品列表
- (void)hotVMDelegateGetArtsList_succeed;//成功
- (void)hotVMDelegateGetArtsList_failure;//失败

#pragma mark - 获取搜索/热门/艺术家列表
- (void)hotVMDelegateGetArtsAuthorList_succeed;//成功
- (void)hotVMDelegateGetArtsAuthorList_failure;//失败

@end