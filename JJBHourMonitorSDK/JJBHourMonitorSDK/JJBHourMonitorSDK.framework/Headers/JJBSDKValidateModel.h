//
//  JJBSDKValidateModel.h
//  JJBHourMonitorSDK
//
//  Created by JJB_iOS on 2022/7/29.
//

#import <Foundation/Foundation.h>

// 校验携带参数对象
@interface JJBSDKValidateModel : NSObject
@property (nonatomic, copy) NSString *imageUrl;         ///< 截图路径        false string
@property (nonatomic, assign) NSInteger progress;       ///< 进度秒        false integer
@end

