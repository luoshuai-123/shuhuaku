//
//  KDBaseCommand.h
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
#import "AFNetworking.h"

static NSString * const api_domain = @"http://api.juanpi.com";//接口头





@interface WSBaseCommand_input : Jastor

@property (strong,nonatomic) NSString * system;//系统类型：ios/android
@property (strong,nonatomic) NSString * system_version;//系统版本
@end


@interface WSBaseCommand_output : Jastor
@property (strong,nonatomic) NSString * info;
@property (strong,nonatomic) NSNumber * code;
@property (strong,nonatomic) id data;
@end

@interface WSBaseCommand : Jastor
@property (strong,nonatomic) NSString * path;
@property (strong,nonatomic) WSBaseCommand_input * input;
@property (strong,nonatomic) WSBaseCommand_output * output;

@property (strong,nonatomic) void (^callback) (WSBaseCommand *command,AFHTTPRequestOperation *operation, NSError *error);
-(void)setCallback:(void (^)(WSBaseCommand *command, AFHTTPRequestOperation *operation, NSError *error))callback;

-(NSDictionary*)form;

@end
