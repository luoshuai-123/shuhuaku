//
//  AFHTTPRequestOperation+QMEX.h
//  QMNetworkKitDemo
//
//  Created by Brick on 14-7-11.
//  Copyright (c) 2014年 Brick. All rights reserved.
//

#import "AFHTTPRequestOperation.h"

static char kAFOperarionStartDateKey;

@interface AFHTTPRequestOperation (QMEX)

@property (readwrite, nonatomic, strong, setter = af_setStartDate:) NSDate *af_startDate;

@end
