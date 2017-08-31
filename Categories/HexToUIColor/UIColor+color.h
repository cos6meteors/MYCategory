//
//  UIColor+color.h
//  MZLibs
//
//  Created by Murphy Zheng on 16/5/26.
//  Copyright © 2016年 Mieasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (color)
/**
 *  生成随机色
 *
 *  @return UIColor
 */
+ (UIColor *)createRandomColor;

/**
 *  颜色转化（6位十六进制数字符串 ——> UIColor）
 *
 *  @param hexString hex color string
 *  @param alpha     alpha
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
