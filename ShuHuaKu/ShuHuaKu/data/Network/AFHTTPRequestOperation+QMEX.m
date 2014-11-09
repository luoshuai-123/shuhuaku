//
//  AFHTTPRequestOperation+QMEX.m
//  QMNetworkKitDemo
//
//  Created by Brick on 14-7-11.
//  Copyright (c) 2014年 Brick. All rights reserved.
//

#import "AFHTTPRequestOperation+QMEX.h"
#import <objc/runtime.h>

@implementation AFHTTPRequestOperation (QMEX)

- (NSDate *)af_startDate {
    return (NSDate *)objc_getAssociatedObject(self, &kAFOperarionStartDateKey);
}

- (void)af_setStartDate:(NSDate *)af_startDate{
    objc_setAssociatedObject(self, &kAFOperarionStartDateKey, af_startDate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end
