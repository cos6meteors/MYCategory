//
//  NSString+SizeToFit.h
//  greattang
//
//  Created by Murphy Zheng on 2018/6/22.
//  Copyright © 2018年 Mieasy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SizeToFit)

/**
 根据字符串返回自适应的尺寸

 @param font 字体
 @param maxSize 最大限度尺寸
 @return 自适应后的尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 根据字符串返回自适应的尺寸，用于计算字体的尺寸

 @param attrs 属性
 @param maxSize 最大限制尺寸
 @return 自适应后的尺寸
 */
- (CGSize)sizeWithArrrs:(NSDictionary *)attrs maxSize:(CGSize)maxSize;


@end
