//
//  SHHotView.h
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/15.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import "SHBaseView.h"

@interface SHHotView : SHBaseView

@end



@interface SHHotArtsListView : SHBaseView

- (void)showUI:(NSArray *)arrayModel;

- (CGSize)sizeHot;
@end


@interface SHHotArtsAuthorListView : SHBaseView

- (void)showUI:(NSArray *)arrayModel;

- (CGSize)sizeHot;
@end
