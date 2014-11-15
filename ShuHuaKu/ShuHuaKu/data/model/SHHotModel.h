//
//  SHHotModel.h
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/9.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import "Jastor.h"

@interface SHHotModel : Jastor
@property (nonatomic, strong) NSString *addtime;
@property (nonatomic, strong) NSString *catename;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *groupid;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSArray *imgPath;
@property (nonatomic, strong) NSString *iscollect;
@property (nonatomic, strong) NSString *islike;
@property (nonatomic, strong) NSString *isvip;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *topicid;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *width;
//"count_collect" = 0;
//"count_comment" = 4;
//"count_like" = 0;
//"count_relay" = 0;
@end
@interface SHArtsAuthorListModel : Jastor
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *isfollow;
@property (nonatomic, strong) NSString *isvip;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *spacename;
@property (nonatomic, strong) NSString *useraccount;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *username;
@end

