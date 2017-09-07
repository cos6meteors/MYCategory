//
//  UIButton+Shade.h
//  HyLife
//
//  Created by Murphy Zheng on 17/3/23.
//  Copyright © 2017年 Mieasy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFromColor             [UIColor colorWithRed:114.0/255.0 green:210.0/255.0 blue:53.0/255.0 alpha:1.0]
#define kToColor               [UIColor colorWithRed:57.0/255.0  green:135.0/255.0 blue:27.0/255.0 alpha:1.0]

@interface UIButton (Shade)

+ (void)shadeButton:(UIButton *)button;

@end
