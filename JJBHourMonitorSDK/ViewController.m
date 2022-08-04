//
//  ViewController.m
//  JJBHourMonitorSDK
//
//  Created by JJB_iOS on 2022/8/3.
//

#import "ViewController.h"
#import "AppDelegate.h"

#import <JJBHourMonitorSDK/JJBHourMonitorSDK.h>

#import "ZFPlayer.h"
#import "ZFAVPlayerManager.h"
#import "ZFPlayerControlView.h"

@interface ViewController ()<JJBStudyMonitorSDKDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (nonatomic, strong) ZFPlayerController *player;
@property (nonatomic, strong) ZFPlayerControlView *controlView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSDK];
    [self setupPlayer];
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

- (void)setupPlayer
{
    // ZFPlayer
    ZFAVPlayerManager *playerManager = [[ZFAVPlayerManager alloc] init];
    self.player = [ZFPlayerController playerWithPlayerManager:playerManager containerView:self.coverImageView];
    self.player.controlView = self.controlView;
    self.player.pauseWhenAppResignActive = NO;
    
    @weakify(self)
    
    // 横竖屏将要切换
    self.player.orientationWillChange = ^(ZFPlayerController * _Nonnull player, BOOL isFullScreen) {
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        appDelegate.allowOrentitaionRotation = isFullScreen;
    };
    
    // 播放时间改变
    self.player.playerPlayTimeChanged = ^(id<ZFPlayerMediaPlayback>  _Nonnull asset, NSTimeInterval currentTime, NSTimeInterval duration){
        [[JJBStudyMonitorSDK shared] updateStudySchedule:currentTime];
    };
    
    // 播放完成
    self.player.playerDidToEnd = ^(id  _Nonnull asset) {
        @strongify(self)
        [[JJBStudyMonitorSDK shared] updateStudySchedule:self.player.currentTime];
    };
}

- (void)startPlay
{
    self.player.assetURLs = @[[NSURL URLWithString:@"https://vod.cqjjb.cn/customerTrans/79171af5dbc8d607a9ef750f5de64fd3/31ed50df-181f143072c-0004-69c1-ba4-801ce.mp4"]];
    [self.player playTheIndex:0];
    [self.controlView showTitle:nil
                 coverURLString:nil
                 fullScreenMode:ZFFullScreenModeAutomatic];
}

#pragma mark - JJBStudyMonitorSDKDelegate

/**
 * SDK初始化成功
 */
- (void)studyMonitorSDKInitSucceed
{
    NSLog(@"SDK初始化成功");
    [self startPlay];
}

/**
 * SDK初始化失败
 * @param errCode 错误编码
 * @param errMessage 错误消息
 */
- (void)studyMonitorSDKInitFailure:(NSString *)errCode errMessage:(NSString *)errMessage
{
    NSLog(@"SDK初始化失败 errCode：%@ errMessage：%@", errCode, errMessage);
}

/**
 * 触发了校验，建议在此处暂停视频
 */
- (JJBSDKValidateModel *)studyMonitorSDKTriggerValidate
{
    [self.player.currentPlayerManager pause];
    
    JJBSDKValidateModel *model = [JJBSDKValidateModel new];
    model.imageUrl = @"http://www.baidu.com";
    model.progress = self.player.currentTime;
    return model;
}

/**
 * 校验成功，如果在触发校验暂停了视频，在此可以继续播放
 */
- (void)studyMonitorSDKValidateSucceed
{
    [self.player.currentPlayerManager play];
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

#pragma mark - Getter & Setter

- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [ZFPlayerControlView new];
        _controlView.fastViewAnimated = YES;
        _controlView.autoHiddenTimeInterval = 5;
        _controlView.autoFadeTimeInterval = 0.25;
        _controlView.portraitControlView.titleLabel.hidden = YES;
    }
    return _controlView;
}

@end
