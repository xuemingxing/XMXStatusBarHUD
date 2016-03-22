//
//  XMXStatusBarHUD.m
//  XMXStatusBarHUD
//
//  Created by 薛明星 on 16/3/22.
//  Copyright © 2016年 xuemingxing. All rights reserved.
//

#define XMXMessageFont [UIFont systemFontOfSize:12]

#import "XMXStatusBarHUD.h"

@implementation XMXStatusBarHUD

/** 消息停留的时间*/
static CGFloat const XMXMessageDuration = 2.0;

/** 窗口显示或者消失的时间*/
static CGFloat const XMXAnimationDuration = 0.25;

/** 定时器*/
static NSTimer *timer_;

/** 要显示的窗口*/
static UIWindow *window_;

/** 显示窗口 */
+(void)showWindow{
    
    //设置window的动画
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH,  [UIScreen mainScreen].bounds.size.width, windowH);
    
    //创建之前把原来的隐藏
    window_.hidden = YES;
    //创建window
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    //显示window
    window_.hidden = NO;
    
    //设置动画
    frame.origin.y = 0;
    [UIView animateWithDuration:XMXAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *显示普通信息
 *@param mgs 要显示的信息
 *@param image 要显示的图片
 */
+(void)showMessage:(NSString *)mgs image:(UIImage *)image{
    
    //销毁定时器
    [timer_ invalidate];
    
    //显示窗口
    [self showWindow];
        //添加按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:mgs forState:UIControlStateNormal];
    btn.titleLabel.font = XMXMessageFont;
    if (image) {  //如果有图片
        [btn setImage:image forState:UIControlStateNormal];
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    //设置frame
    btn.frame = window_.bounds;
    
    [window_ addSubview:btn];
    
    //创建并启动定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMXMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];

}

/**
 *显示普通信息
 */
+(void)showMessage:(NSString *)mgs{
    
    [self showMessage:mgs image:nil];

}

/**
 *显示成功信息
 */
+(void)showSuccess:(NSString *)mgs{
    
    [self showMessage:mgs image:[UIImage imageNamed:@"XMXStatusBarHUD.bundle/success"]];
}
/**
 *显示失败信息
 */
+(void)showError:(NSString *)mgs{
    
    [self showMessage:mgs image:[UIImage imageNamed:@"XMXStatusBarHUD.bundle/error"]];

}
/**
 *显示正在加载信息
 */
+(void)showLoading:(NSString *)mgs{
    
    //移除定时器
    [timer_ invalidate];
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    //添加标签
    UILabel *label = [[UILabel alloc] init];
    label.text = mgs;
    label.font = XMXMessageFont;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.frame = window_.bounds;
    
    [window_ addSubview:label];
    
    //添加QQ
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //文字宽度
    CGFloat mgsW = [mgs sizeWithAttributes:@{NSFontAttributeName : XMXMessageFont}].width;
    //设置中心
    CGFloat centerX = (window_.bounds.size.width - mgsW ) * 0.5 - 20;
    CGFloat centerY = window_.bounds.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [loadingView startAnimating];
    [window_ addSubview:loadingView];

}
/**
 *隐藏信息
 */
+(void)hide{
    
    CGRect frame = window_.frame;
    
    //设置动画
    frame.origin.y = -frame.size.height;
    [UIView animateWithDuration:XMXAnimationDuration animations:^{
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        
        timer_ = nil;
    }];
}



@end
