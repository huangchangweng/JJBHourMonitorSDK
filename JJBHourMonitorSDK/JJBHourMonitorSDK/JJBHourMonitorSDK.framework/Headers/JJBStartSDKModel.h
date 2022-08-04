//
//  JJBStartSDKModel.h
//  JJBHourMonitorSDK
//
//  Created by JJB_iOS on 2022/7/29.
//

#import <Foundation/Foundation.h>
#import <JJBHourMonitorSDK/JJBStudentInfoModel.h>
#import <JJBHourMonitorSDK/JJBStudyInfoModel.h>

// 初始化SDK对象
@interface JJBStartSDKModel : NSObject
@property (nonatomic, strong) JJBStudentInfoModel *studentInfo; ///< 学员信息
@property (nonatomic, strong) JJBStudyInfoModel *studyInfo;     ///< 学习信息
@end
