//
//  Notification.h
//  SampleApp
//
//  Created by iaosee on 2022/8/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Notification : NSObject

+ (Notification *) notificationManager;
- (void) checkNotificationAuthorization;
- (void) _localNotification;

@end

NS_ASSUME_NONNULL_END
