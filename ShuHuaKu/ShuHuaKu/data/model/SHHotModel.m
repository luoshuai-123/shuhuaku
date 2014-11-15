//
//  SHHotModel.m
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/9.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import "SHHotModel.h"

@implementation SHHotModel
- (id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if (self) {
        
    }
    return self;
}
@end


@implementation SHArtsAuthorListModel
- (NSString *)address{
    if (!_address) {
        return @"";
    }
    return _address;
}
- (NSString *)avatar{
    if (!_avatar) {
        return @"";
    }
    return _avatar;
}
- (NSString *)username{
    if (!_username) {
        return @"";
    }
    return _username;
}
- (id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if (self) {
        
    }
    return self;
}
@end