//
//  JJBStudyMonitorSDK.h
//  JJBHourMonitorSDK
//
//  Created by JJB_iOS on 2022/7/29.
//

#import <Foundation/Foundation.h>
#import <JJBHourMonitorSDK/JJBStartSDKModel.h>
#import <JJBHourMonitorSDK/JJBSDKValidateModel.h>

@class JJBStudyMonitorSDK;
@protocol JJBStudyMonitorSDKDelegate <NSObject>

@required

/**
 * SDK初始化成功
 */
- (void)studyMonitorSDKInitSucceed;

/**
 * 触发了校验，建议在此处暂停视频
 */
- (JJBSDKValidateModel *)studyMonitorSDKTriggerValidate;

/**
 * 校验成功，如果在触发校验暂停了视频，在此可以继续播放
 */
- (void)studyMonitorSDKValidateSucceed;

/**
 * 其他平台重复学习回调
 */
- (void)studyMonitorSDKOtherPlatformStudy;

@optional

/**
 * SDK初始化失败
 * @param errCode 错误编码
 * @param errMessage 错误消息
 */
- (void)studyMonitorSDKInitFailure:(NSString *)errCode errMessage:(NSString *)errMessage;

/**
 * 校验失败
 * @param errCode 错误编码
 * @param errMessage 错误消息
 */
- (void)studyMonitorSDKValidateFailure:(NSString *)errCode errMessage:(NSString *)errMessage;

@end

@interface JJBStudyMonitorSDK : NSObject

/**
 * 初始化SDK
 */
+ (instancetype)shared;

/**
 *  开始学时监管
 *  @param startModel 初始化SDK对象
 *  @param delegate 回调代理
 */
- (void)startSDKWithModel:(JJBStartSDKModel *)startModel
                 delegate:(id<JJBStudyMonitorSDKDelegate>)delegate;

/**
 * 实时更新学习进度
 * @param studySchedule 学习进度 单位：秒 (录播：视频进度 直播：观看时长)
 */
- (void)updateStudySchedule:(NSInteger)studySchedule;

/**
 * 视频结束
 * @param progress 结束视频进度
 */
- (void)endStudySchedule:(NSInteger)progress;

@end
