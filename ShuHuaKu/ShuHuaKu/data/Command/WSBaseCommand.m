//
//  KDBaseCommand.m
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import "WSBaseCommand.h"

@implementation WSBaseCommand_input

@end
@implementation WSBaseCommand_output
- (NSNumber *)code{
    if ([_code isKindOfClass:[NSString class]]) {
        return [NSNumber numberWithInt:[_code intValue]];
    }
    return _code;
}
@end

@implementation WSBaseCommand

-(NSString*)system{
    return @"iOS";
}
-(NSString*)system_version{
    return SYSTEMVALUE.systemVersion.stringValue;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString * className = NSStringFromClass([self class]);
        NSString * inputClassName =[NSString stringWithFormat:@"%@_input",className];
        NSString * outputClassName = [NSString stringWithFormat:@"%@_output",className];
        
        self.input = [NSClassFromString(inputClassName) new];
        self.output = [NSClassFromString(outputClassName) new];
    }
    return self;
}

#pragma mark - 输入
-(NSString*)path{
    return api_domain;
}

-(NSDictionary*)form{
    return [self.input toDictionary];
}


@end
