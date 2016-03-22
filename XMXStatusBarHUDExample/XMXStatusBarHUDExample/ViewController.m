//
//  ViewController.m
//  XMXStatusBarHUDExample
//
//  Created by 薛明星 on 16/3/22.
//  Copyright © 2016年 xuemingxing. All rights reserved.
//

#import "ViewController.h"
#import "XMXStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)message:(id)sender {
    [XMXStatusBarHUD showMessage:@"没什么事情!!!!!"];
}

- (IBAction)success:(id)sender {
    [XMXStatusBarHUD showSuccess:@"数据下载成功"];
    
}
- (IBAction)error:(id)sender {
    [XMXStatusBarHUD showError:@"数据下载失败"];
}
- (IBAction)load:(id)sender {
    [XMXStatusBarHUD showLoading:@"正在下载中..."];
}
- (IBAction)hide {
    [XMXStatusBarHUD hide];
}
- (IBAction)showImage:(id)sender {
    [XMXStatusBarHUD showMessage:@"这是一个消息" image:[UIImage imageNamed:@"message"]];
}
@end
