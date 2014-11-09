//
//  KDTestCommand.h
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import "WSBaseCommand.h"

@interface KDTestCommand : WSBaseCommand

@end

@interface KDHomeTestCommand_input : WSBaseCommand_input
@property (nonatomic , strong) NSString * goods_id;//商品标识
@property (nonatomic , strong) NSString * username;//用户昵称
@end

@interface KDHomeTestCommand_output : WSBaseCommand_output
@property (nonatomic,strong) NSDictionary * data;
@end
@interface KDHomeTestCommand : KDTestCommand   @end
