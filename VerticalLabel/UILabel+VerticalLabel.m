//
//  UILabel+VerticalLabel.m
//  MZLibs
//
//  Created by Murphy Zheng on 16/5/26.
//  Copyright © 2016年 Mieasy. All rights reserved.
//

#import "UILabel+VerticalLabel.h"

@implementation UILabel (VerticalLabel)

+ (UILabel *)verticalLabelWithText:(NSString *)text {
    
    UIFont* font = [UIFont fontWithName:@"Helvetica-bold" size:10];
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(10.0f, 460-44) lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"height = %f,width = %f",size.height,size.width);
    UILabel* verticalLabel = [[UILabel alloc]initWithFrame:CGRectMake(220-(size.width+15),10, size.width, size.height)];
    verticalLabel.textColor = [UIColor whiteColor];
    verticalLabel.text = text;
    verticalLabel.numberOfLines = 0;
    verticalLabel.font = font;
    return verticalLabel;
    
}

@end
