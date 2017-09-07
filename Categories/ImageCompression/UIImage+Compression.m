//
//  UIImage+Compression.m
//  YMCategory
//
//  Created by Murphy Zheng on 17/9/7.
//  Copyright © 2017年 mieasy. All rights reserved.
//

#import "UIImage+Compression.h"

@implementation UIImage (Compression)

+ (UIImage *)reduceImage:(UIImage *)image percent:(float)percent {
    NSData *imageData = UIImageJPEGRepresentation(image, percent);
    UIImage *newImage = [UIImage imageWithData:imageData];
    return newImage;
}

+ (UIImage *)scaleImage:(UIImage *)image withNewSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (NSData *)compressImage:(UIImage *)image targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = image.size;
    CGFloat width  = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth  = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth  = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if (CGSizeEqualToSize(imageSize, targetSize)) {
        CGFloat widthFactor = targetWidth/width;
        CGFloat heightFactor = targetHeight/height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(targetSize);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [image drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    UIGraphicsEndImageContext();
    NSData *newImageData = UIImageJPEGRepresentation(newImage, 1.0);
    return newImageData;
}

@end
