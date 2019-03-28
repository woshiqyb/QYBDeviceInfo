//
//  QYBDeviceInfo.h
//  QYBDeviceInfo
//
//  Created by 钱洋彪 on 2019/3/27.
//  Copyright © 2019 钱洋彪. All rights reserved.
//

#import "GBDeviceInfo_iOS.h"
#import "QYBDeviceInfoInterface.h"

@interface QYBDeviceInfo : GBDeviceInfo <QYBDeviceInfoInterface>
+ (QYBDeviceInfo *)deviceInfo;

@end
