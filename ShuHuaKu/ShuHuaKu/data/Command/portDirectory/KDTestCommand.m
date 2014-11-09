//
//  KDTestCommand.m
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import "KDTestCommand.h"

@implementation KDTestCommand@end





@implementation KDHomeTestCommand_input
- (NSString *)goods_id{
    if (!_goods_id) {
        return @"1";
    }
    return _goods_id;
}
@end

@implementation KDHomeTestCommand_output @end

@implementation KDHomeTestCommand
-(NSString*)path
{
    return [NSString stringWithFormat:@"%@",api_domain];
}

@end