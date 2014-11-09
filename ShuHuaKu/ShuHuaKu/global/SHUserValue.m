//
//  KDUserValue.m
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import "SHUserValue.h"

@implementation SHUserValue

- (NSNumber *)islogin{
    if (!_islogin) {
        return @NO;
    }
    return _islogin;
}

-(void)saveToDisk{
    NSDictionary * dic = [self toDictionary];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:dic forKey:GLOBALVALUE_USERVALUE];
    [defaults synchronize];
}
- (void)saveInfo:(id)output{
    
    self.islogin = @YES;
    [self saveToDisk];
    [self postNotification:NOTIFY_Login];
}

- (void)logoutSave{
    self.islogin = @NO;
    [self saveToDisk];
    [self postNotification:NOTIFY_Logout];
}
@end
