//
//  ViewController.m
//  JJBHourMonitorSDK
//
//  Created by JJB_iOS on 2022/8/3.
//

#import "ViewController.h"
#import <JJBHourMonitorSDK/JJBHourMonitorSDK.h>

@interface ViewController ()<JJBStudyMonitorSDKDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSDK];
}

#pragma mark - Private Mehtod

- (void)initSDK
{
    JJBStartSDKModel *startModel = [JJBStartSDKModel new];

    JJBStudentInfoModel *studentInfoModel = [JJBStudentInfoModel new];
    studentInfoModel.certNum = @"sdfsfsfsf12213";
    studentInfoModel.idCard = @"511623199608245911";
    studentInfoModel.linkStudentId = @"465121652";
    startModel.studentInfo = studentInfoModel;

    JJBStudyInfoModel *studyInfoModel = [JJBStudyInfoModel new];
    studyInfoModel.appKey = @"98455545";
    studyInfoModel.chapterTitle = @"打发时间地方";
    studyInfoModel.content = @"欧UI任务熊二娃儿";
    studyInfoModel.courseName = @"两地分居流水段否";
    studyInfoModel.courseType = 1;
    studyInfoModel.desc = @"两地分居是";
    studyInfoModel.duration = 10000;
    studyInfoModel.isMust = 1;
    studyInfoModel.md5 = @"27937468sdfsdfsdf";
    studyInfoModel.planName = @"测试学习计划";
    studyInfoModel.trainPostName = @"岗前培训";
    studyInfoModel.trainType = @"SEND_GQPX";
    studyInfoModel.type = 1;
    studyInfoModel.videoName = @"测试学习计划视频";
    studyInfoModel.videoUrl = @"http://www.baidu.com";
    startModel.studyInfo = studyInfoModel;

    // 初始化SDK并开始学时监管
    [[JJBStudyMonitorSDK shared] startSDKWithModel:startModel delegate:self];
}

#pragma mark - Response Event

- (IBAction)actions:(UIButton *)sender {
    // 初始化SDK
    if (sender.tag == 0) {
        sender.enabled = NO;
        [self initSDK];
    }
    // 开始播放视频
    else if (sender.tag == 1) {
//        [self startPlayVideo];
    }
    // 结束播放视频
    else if (sender.tag == 2) {
//        [[JJBStudyMonitorSDK shared] endStudySchedule:self.videoSchedule];
    }
}

#pragma mark - JJBStudyMonitorSDKDelegate

/**
 * SDK初始化成功
 */
- (void)studyMonitorSDKInitSucceed
{
    NSLog(@"SDK初始化成功");
}

/**
 * SDK初始化失败
 * @param errCode 错误编码
 * @param errMessage 错误消息
 */
- (void)studyMonitorSDKInitFailure:(NSString *)errCode errMessage:(NSString *)errMessage
{
    NSLog(@"SDK初始化失败 errCode：%@ errMessage：%@", errCode, errMessage);
//    [self.iniButton setEnabled:YES];
}

/**
 * 触发了校验，建议在此处暂停视频
 */
- (JJBSDKValidateModel *)studyMonitorSDKTriggerValidate
{
    JJBSDKValidateModel *model = [JJBSDKValidateModel new];
    model.imageUrl = @"http://www.baidu.com";
//    model.progress = self.videoSchedule;
    return model;
}

/**
 * 校验成功，如果在触发校验暂停了视频，在此可以继续播放
 */
- (void)studyMonitorSDKValidateSucceed
{
    
}

/**
 * 校验失败
 * @param errCode 错误编码
 * @param errMessage 错误消息
 */
- (void)studyMonitorSDKValidateFailure:(NSString *)errCode errMessage:(NSString *)errMessage;
{
    
}

/**
 * 其他平台重复学习回调
 */
- (void)studyMonitorSDKOtherPlatformStudy
{
    
}

@end
