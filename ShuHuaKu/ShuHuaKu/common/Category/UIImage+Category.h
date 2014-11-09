//
//  UIImage+Category.h
//  Juanpi_2.0
//
//  Created by luoshuai on 14-2-24.
//  Copyright (c) 2014年 Juanpi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)
+ (UIImage *) captureScreen ;//截屏

/**
 *  压缩图片
 *
 *  @param image 需要压塑的图片
 *
 *  @return 压缩好的图片
 */
+ (UIImage *)compressionWithImage:(UIImage *)image toSize:(CGSize )size;
@end
