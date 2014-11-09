//
//  UIImageView+SHWebImageAndCache.h
//  ShuHuaKu
//
//  Created by luoshuai on 14/11/9.
//  Copyright (c) 2014年 SH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SHWebImageAndCache)
- (void)setImageWithURLString:(NSString *)url placeholdImage:(UIImage *)image;
@end