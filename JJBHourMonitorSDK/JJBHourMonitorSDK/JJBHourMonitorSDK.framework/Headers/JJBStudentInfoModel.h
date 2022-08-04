//
//  JJBStudentInfoModel.h
//  JJBHourMonitorSDK
//
//  Created by JJB_iOS on 2022/7/29.
//

#import <Foundation/Foundation.h>

// 学员信息
@interface JJBStudentInfoModel : NSObject
@property (nonatomic, copy) NSString *certNum;      ///< 证书编号        false string
@property (nonatomic, copy) NSString *idCard;       ///< 身份证号        false string
@property (nonatomic, copy) NSString *linkStudentId;///< 第三方平台学员ID        false string
@end

