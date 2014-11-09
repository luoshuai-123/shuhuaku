//
//  UIImageView+SHWebImageAndCache.m
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/9.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import "UIImageView+SHWebImageAndCache.h"
#import "UIImageView+WebCache.h"
@implementation UIImageView (SHWebImageAndCache)
- (void)setImageWithURLString:(NSString *)url placeholdImage:(UIImage *)image{
    [self sd_setImageWithURL:[NSURL URLWithString:url]
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                   }];
    
}
@end
