//
//  MZRotatingScreen.h
//  MZLibs
//
//  Created by Murphy Zheng on 16/5/26.
//  Copyright © 2016年 Mieasy. All rights reserved.
//
/**
 * 屏幕状态类型
 * UIInterfaceOrientationUnknown            = UIDeviceOrientationUnknown,未知方向
 * UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait,屏幕直立
 * UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown,屏幕直立，上下顛倒
 * UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight,屏幕向右橫置
 * UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft,屏幕向左橫置
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MZRotatingScreen : NSObject

/**
 *  切换横竖屏
 *  一般切换：UIInterfaceOrientationPortrait <==> UIInterfaceOrientationLandscapeRight
 *  @param orientation ：UIInterfaceOrientation
 */
+ (void)forceOrientation: (UIInterfaceOrientation)orientation;

/**
 *  判断是否竖屏
 *
 *  @return 布尔值
 */
+ (BOOL)isOrientationLandscape;

@end
