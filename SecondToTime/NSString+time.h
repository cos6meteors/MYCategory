//
//  NSString+time.h
//  MZLibs
//
//  Created by Murphy Zheng on 16/5/26.
//  Copyright © 2016年 Mieasy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSString (time)

//秒转化成时间格式（HH:mm:ss）
+ (NSString *)timeFromSecond:(CGFloat)second;

@end
