//
//  UIImage+Compression.h
//  YMCategory
//
//  Created by Murphy Zheng on 17/9/7.
//  Copyright © 2017年 mieasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compression)


/**
 压缩图片质量（图片体积减小，像素不变）

 @param image origin image
 @param percent compress percent
 @return compressed image
 */
+ (UIImage *)reduceImage:(UIImage *)image percent:(float)percent;


/**
图片压缩到指定尺寸

 @param image origin image
 @param newSize to size
 @return compressed image
 */
+ (UIImage *)scaleImage:(UIImage *)image withNewSize:(CGSize)newSize;


/**
 等比例压缩（压缩到指定尺寸）

 @param image origin image
 @param targetSize target image size
 @return compressed image
 */
+ (NSData *)compressImage:(UIImage *)image targetSize:(CGSize)targetSize;

@end
