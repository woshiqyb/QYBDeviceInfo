//
//  QYBDeviceNormaliPad.m
//  QYBDeviceInfo
//
//  Created by 钱洋彪 on 2019/3/27.
//  Copyright © 2019 钱洋彪. All rights reserved.
//

#import "QYBDeviceNormaliPad.h"

// 非圆角的iPad本来常规状态下statusBar和topInsets均为20；
// 奈何iPad Air 3rd 非要来个24；
@implementation QYBDeviceNormaliPad

- (CGFloat)statusBarHeight {
    return MAX(20, [self topInsets]);
}

- (CGFloat)tabBarHeight {
    return 50;
}

- (CGFloat)navigationBarHeight {
    return 50;
}

- (CGFloat)bottomInsets {
    return 0;
}

- (CGFloat)topInsets {
    static CGFloat top = 20;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)) {
            // 状态栏有通知的时候会变成40，但我并不Care
            CGFloat temp = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.top;
            if (temp == 24) {
                top = temp;
            }
        }
    });
    return top;
}
@end
