//
//  UIColor+color.m
//  MZLibs
//
//  Created by Murphy Zheng on 16/5/26.
//  Copyright © 2016年 Mieasy. All rights reserved.
//

#import "UIColor+color.h"

@implementation UIColor (color)

+ (UIColor *)createRandomColor {
    
    //色度(0.0 to 1.0)
    CGFloat hue =        (arc4random() % 256 / 256.0);
    //饱和(0.5 to 1.0,away from white)
    CGFloat saturation = (arc4random() % 128 / 256.0) + 0.5;
    //亮度(0.5 to 1.0,away from black)
    CGFloat brightness = (arc4random() % 128 / 256.0) + 0.5;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
}

+ (UIColor *)colorWithRGBHexValue:(UInt32)hexValue alpha:(CGFloat)alpha {

    int r = (hexValue >> 16) & 0xFF;
    int g = (hexValue >> 8) & 0xFF;
    int b = (hexValue) & 0xFF;
    
    return [UIColor colorWithRed:r/255.0
                           green:g/255.0
                            blue:b/255.0
                           alpha:alpha];
    
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha{

    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    unsigned  hexNumber;
    if (![scanner scanHexInt:&hexNumber])
        return nil;
    return [UIColor colorWithRGBHexValue:hexNumber alpha:alpha];
    
}


@end
