//
//  MEUserListCell.h
//  HyLife
//
//  Created by Murphy Zheng on 13/8/26.
//  Copyright © 2016年 Mieasy. All rights reserved.
//  根據颜色生成对应图片

#import <UIKit/UIKit.h>

@interface UIImage (Color)


/**
 用颜色生成图片

 @param color UIColor
 @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
