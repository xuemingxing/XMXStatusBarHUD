//
//  XMXStatusBarHUD.h
//  XMXStatusBarHUD
//
//  Created by 薛明星 on 16/3/22.
//  Copyright © 2016年 xuemingxing. All rights reserved.
// 大版本号.功能版本号.BUG修复版本号
// 0.0.0

#import <UIKit/UIKit.h>

@interface XMXStatusBarHUD : NSObject

/**
 *显示普通信息
 *@param mgs 要显示的信息
 *@param image 要显示的图片
 */
+(void)showMessage:(NSString *)mgs image:(UIImage *)image;
/**
 *显示普通信息
 */
+(void)showMessage:(NSString *)mgs;

/** 
 *显示成功信息
 */
+(void)showSuccess:(NSString *)mgs;
/**
 *显示失败信息
 */
+(void)showError:(NSString *)mgs;
/**
 *显示正在加载信息
 */
+(void)showLoading:(NSString *)mgs;
/**
 *隐藏信息
 */
+(void)hide;

@end
