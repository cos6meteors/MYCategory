//
//  NSString+SizeToFit.m
//  greattang
//
//  Created by Murphy Zheng on 2018/6/22.
//  Copyright © 2018年 Mieasy. All rights reserved.
//

#import "NSString+SizeToFit.h"

@implementation NSString (SizeToFit)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

- (CGSize)sizeWithArrrs:(NSDictionary *)attrs maxSize:(CGSize)maxSize {
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

@end
