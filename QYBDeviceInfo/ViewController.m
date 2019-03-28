//
//  ViewController.m
//  QYBDeviceInfo
//
//  Created by 钱洋彪 on 2019/3/27.
//  Copyright © 2019 钱洋彪. All rights reserved.
//

#import "ViewController.h"
#import "QYBDeviceInfo/QYBDeviceInfo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 仅限竖屏且状态栏上没有通知的情况
    UIEdgeInsets edgeInsets = [[[[UIApplication sharedApplication] delegate] window] safeAreaInsets];
    CGRect frame1 = self.tabBarController.tabBar.frame;
    CGRect frame2 = self.navigationController.navigationBar.frame;
    CGRect frame3 = [UIApplication sharedApplication].statusBarFrame;
    NSLog(@"edgeInsets = %@",NSStringFromUIEdgeInsets(edgeInsets));
    NSLog(@"tabBar = %@",NSStringFromCGRect(frame1));
    NSLog(@"navBar = %@",NSStringFromCGRect(frame2));
    NSLog(@"statusBar = %@",NSStringFromCGRect(frame3));
    QYBDeviceInfo *deviceInfo = [QYBDeviceInfo deviceInfo];
    NSAssert(edgeInsets.top == [deviceInfo topInsets], @"有错误");
    NSAssert(edgeInsets.bottom == [deviceInfo bottomInsets], @"有错误");
    NSAssert(frame1.size.height == [deviceInfo tabBarHeight], @"有错误");
    NSAssert(frame2.size.height == [deviceInfo navigationBarHeight], @"有错误");
    NSAssert(frame3.size.height == [deviceInfo statusBarHeight], @"有错误");
}


@end
