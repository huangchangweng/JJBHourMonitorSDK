# JJBHourMonitorSDK
iOS建教帮学时监管SDK



#### 添加工程配置

##### 导入方式

1.推荐使用 Cocoapods 导入方式选择最新版本方式集成

``` objc
pod 'JJBHourMonitorSDK', '1.0.0'
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







