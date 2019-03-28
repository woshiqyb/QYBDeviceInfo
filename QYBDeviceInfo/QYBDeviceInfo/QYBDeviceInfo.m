//
//  QYBDeviceInfo.m
//  QYBDeviceInfo
//
//  Created by 钱洋彪 on 2019/3/27.
//  Copyright © 2019 钱洋彪. All rights reserved.
//

#import "QYBDeviceInfo.h"
#import "QYBDeviceNormaliPhone.h"
#import "QYBDeviceiPhoneX.h"
#import "QYBDeviceNormaliPad.h"
#import "QYBDeviceiPadPro3rd.h"

@implementation QYBDeviceInfo {
    id <QYBDeviceInfoInterface> deviceModel;
}

static QYBDeviceInfo *_deviceInfo;

+ (QYBDeviceInfo *)deviceInfo {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceInfo = (QYBDeviceInfo *)[super deviceInfo];
        GBDeviceModel model = _deviceInfo.model;
        if ((model <= GBDeviceModeliPhone8Plus && model >= GBDeviceModeliPhone1)
            || model == GBDeviceModelUnknown
            || (model >= GBDeviceModeliPod1 && model <= GBDeviceModeliPod6)) {
            // 普通iPhone、未知、iPod
            // iPod没模拟器测试，数据可能是错误的，
            // 而且重点是我不care iPod 😂
            _deviceInfo->deviceModel = [QYBDeviceNormaliPhone new];
        }else if (model >= GBDeviceModeliPhoneX && model <= GBDeviceModeliPhoneXSMax) {
            // X系列
            _deviceInfo->deviceModel = [QYBDeviceiPhoneX new];
        }else if (model >= GBDeviceModeliPad1 && model <= GBDeviceModeliPadPro12p9Inch2) {
            // 普通iPad
            _deviceInfo->deviceModel = [QYBDeviceNormaliPad new];
        }else if (model >= GBDeviceModeliPadPro11p && model <= GBDeviceModeliPadPro12p9Inch31TB) {
            // 三代iPad
            _deviceInfo->deviceModel = [QYBDeviceiPadPro3rd new];
        }else {
            // 将来的设备和模拟器
            if (@available(iOS 11.0, *)) {
                CGFloat bottom = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom;
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    if (bottom > 0) {
                        _deviceInfo->deviceModel = [QYBDeviceiPadPro3rd new];
                    }else {
                        _deviceInfo->deviceModel = [QYBDeviceNormaliPad new];
                    }
                }else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
                    if (bottom <= 0) {
                        _deviceInfo->deviceModel = [QYBDeviceNormaliPhone new];
                    }else {
                        _deviceInfo->deviceModel = [QYBDeviceiPhoneX new];
                    }
                }
            }else {
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    _deviceInfo->deviceModel = [QYBDeviceNormaliPad new];
                }else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
                    _deviceInfo->deviceModel = [QYBDeviceNormaliPhone new];
                }
            }
        }
    });
    return _deviceInfo;
}

// 仅限竖屏
- (CGFloat)statusBarHeight {
    return [deviceModel statusBarHeight];
}

// 仅限竖屏
- (CGFloat)tabBarHeight {
    return [deviceModel tabBarHeight];
}

// 仅限竖屏
- (CGFloat)navigationBarHeight {
    return [deviceModel navigationBarHeight];
}

// 仅限竖屏
- (CGFloat)bottomInsets {
    return [deviceModel bottomInsets];
}

// 仅限竖屏
- (CGFloat)topInsets {
    return [deviceModel topInsets];
}
@end
