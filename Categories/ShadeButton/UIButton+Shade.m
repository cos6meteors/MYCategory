//
//  UIButton+Shade.m
//  HyLife
//
//  Created by Murphy Zheng on 17/3/23.
//  Copyright © 2017年 Mieasy. All rights reserved.
//

#import "UIButton+Shade.h"

@implementation UIButton (Shade)

+ (void)shadeButton:(UIButton *)button {
    
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = button.bounds;
    
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [button.layer addSublayer:gradientLayer];
    
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    //设置颜色数组
    gradientLayer.colors = @[(__bridge id)kFromColor.CGColor,
                                  (__bridge id)kToColor.CGColor];
    
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0.5f), @(1.0f)];
}

@end
