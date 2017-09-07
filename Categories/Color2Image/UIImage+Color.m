//
//  MEUserListCell.h
//  HyLife
//
//  Created by Murphy Zheng on 13/8/26.
//  Copyright © 2016年 Mieasy. All rights reserved.
//
#import "UIImage+Color.h"

@implementation UIImage (Color)


+ (UIImage *)imageWithColor:(UIColor *)color frame:(CGRect)frame {
    UIGraphicsBeginImageContextWithOptions(frame.size, YES, 0.0);
    [color set];
    UIRectFill(CGRectMake(0, 0, frame.size.width, frame.size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
