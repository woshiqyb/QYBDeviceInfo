//
//  QYBDeviceInfoInterface.h
//  QYBDeviceInfo
//
//  Created by 钱洋彪 on 2019/3/27.
//  Copyright © 2019 钱洋彪. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QYBDeviceInfoInterface <NSObject>

@required
// 仅限竖屏
- (CGFloat)statusBarHeight;
// 仅限竖屏
- (CGFloat)tabBarHeight;
// 仅限竖屏
- (CGFloat)navigationBarHeight;
// 仅限竖屏
- (CGFloat)bottomInsets;
// 仅限竖屏
- (CGFloat)topInsets;
@end
