//
//  MYDataPort.h
//  MingYi
//
//  Created by LuoShuai on 14-6-5.
//  Copyright (c) 2014年 QQ:5793348. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SHCommandCallback)(NSDictionary *output, NSError *error);

@interface SHDataPort : NSObject

+ (void)GET:(NSString *)URLString globalTimelinePostsWithBlock:(SHCommandCallback)commandCallback;

+ (void)POST:(NSString *)urlString postInfo:(NSDictionary *)info  globalTimelinePostsWithBlock:(SHCommandCallback)commandCallback;


+ (void)POSTImage:(NSString *)urlString postInfo:(NSDictionary *)info pic:(NSDictionary*)picS globalTimelinePostsWithBlock:(SHCommandCallback)commandCallback;


@end
