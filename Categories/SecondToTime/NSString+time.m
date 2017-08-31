//
//  NSString+time.m
//  MZLibs
//
//  Created by Murphy Zheng on 16/5/26.
//  Copyright © 2016年 Mieasy. All rights reserved.
//

#import "NSString+time.h"

@implementation NSString (time)

+ (NSString *)timeFromSecond:(CGFloat)second {
    
    int h = 0;
    int m = 0;
    int s = 0;
    
    h = second / 3600;
    m = ((long)second % 3600) / 60;
    s = ((long)second % 3600) % 60;
    
    NSString *time = [NSString stringWithFormat:@"%02d:%02d:%02d",h,m,s];
    return time;
    
}

@end
