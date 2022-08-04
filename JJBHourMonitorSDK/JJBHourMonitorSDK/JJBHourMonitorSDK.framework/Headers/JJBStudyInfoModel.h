//
//  JJBStudyInfoModel.h
//  JJBHourMonitorSDK
//
//  Created by JJB_iOS on 2022/7/29.
//

#import <Foundation/Foundation.h>

// 学习信息
@interface JJBStudyInfoModel : NSObject
@property (nonatomic, copy) NSString *appKey;       ///< 平台appKey        false string
@property (nonatomic, copy) NSString *chapterTitle; ///< 小节标题        false string
@property (nonatomic, copy) NSString *content;      ///< 课程内容标题        false string
@property (nonatomic, copy) NSString *courseName;   ///< 课程名称        false string
@property (nonatomic, assign) NSInteger courseType; ///< 点播课程类型 点播课程类型（1专业课程 2公共课程        false integer
@property (nonatomic, copy) NSString *desc;         ///< 视频描述        false string
@property (nonatomic, assign) NSInteger duration;   ///< 视频时长        false integer
@property (nonatomic, assign) NSInteger isMust;     ///< 点播课程属性（0选修 1必修）        false integer
@property (nonatomic, copy) NSString *md5;          ///< 视频md5值        false string
@property (nonatomic, copy) NSString *planName;     ///< 计划名称        false string
@property (nonatomic, copy) NSString *trainPostName;///< 培训岗位        false string
@property (nonatomic, copy) NSString *trainType;    ///< 培训类型 SEND_JXJY:继续教育,SEND_GQPX:岗前培训        false string
@property (nonatomic, assign) NSInteger type;       ///< 课程类型 课程类型1点播课程 3直播课程        false integer
@property (nonatomic, copy) NSString *videoName;    ///< 视频名称        false string
@property (nonatomic, copy) NSString *videoUrl;     ///< 视频地址        false string
@property (nonatomic, copy) NSString *planId;       ///< 计划Id        false string
@property (nonatomic, copy) NSString *taskId;       ///< 任务/课程ID        false string
@end
