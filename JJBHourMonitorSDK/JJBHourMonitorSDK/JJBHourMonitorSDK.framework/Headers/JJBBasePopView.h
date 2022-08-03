//
//  JJBBasePopView.h
//  JJBHourMonitorSDK
//
//  Created by JJB_iOS on 2022/7/26.
//

#import <UIKit/UIKit.h>

@interface JJBBasePopView : UIView
- (void)show;
- (void)dismiss;
- (void)dismissWithCompletion:(void (^)(void))completion;
@end
