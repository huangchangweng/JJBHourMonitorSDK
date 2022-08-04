# JJBHourMonitorSDK
iOS建教帮学时监管SDK



#### 添加工程配置

##### 导入方式

1.推荐使用 Cocoapods 导入方式选择最新版本方式集成

``` objc
pod 'JJBHourMonitorSDK', '1.0.1'
```

2.手动导入

github上下载`zip` - 将工程中`JJBHourMonitorSDK`文件夹copy至自己的工程目录下。

##### 注意事项

1.`工程` - `TARGETS` - `Build Settings` - `Enable Bitcode` 设置为`NO`

2.`工程` - `TARGETS` - `Build Settings` - `Other Librarian Flags` 添加`-ObjC`

3.因为SDK中有人脸验证，所以需在`Info.plist`中配置`Privacy - Photo Library Usage Description`和`Privacy - Camera Usage Description`

#### 初始化SDK

##### 全局配置

```xml
<key>NSAppTransportSecurity</key>
  <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true>
  </dict>
```

##### 添加头文件

``` objc
#import <JJBHourMonitorSDK/JJBHourMonitorSDK.h>
```

##### 添加初始化代码

``` objc
- (void)initSDK
{
    JJBStartSDKModel *startModel = [JJBStartSDKModel new];

    JJBStudentInfoModel *studentInfoModel = [JJBStudentInfoModel new];
    // TODO 各字段赋值...
    startModel.studentInfo = studentInfoModel;

    JJBStudyInfoModel *studyInfoModel = [JJBStudyInfoModel new];
    // TODO 各字段赋值...
    startModel.studyInfo = studyInfoModel;

    // 初始化SDK并开始学时监管
    [[JJBStudyMonitorSDK shared] startSDKWithModel:startModel delegate:self];
}
```

> 注意：`startSDKWithModel:delegate:`此初始化方法在每次切换视频前调用。

##### SDK必须调用的方法

``` objc
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
```

- 方法说明：`updateStudySchedule:`此方法在视频播放器实时回调进度时实时调用。参数说明：`studySchedule`为视频播放器当前进度秒。
- 方法说明：`endStudySchedule:`此方法在用户结束学习时调用。参数说明：`progress`为视频播放器当前进度秒。

##### SDK回调说明

``` objc
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
```

#### 版本说明

- 1.0.1:

  完成JJBHourMonitorSDK搭建



