//
//  Notification.m
//  SampleApp
//
//  Created by iaosee on 2022/8/9.
//

#import "Notification.h"
#import <UserNotifications/UserNotifications.h>

@interface Notification() <UNUserNotificationCenterDelegate>

//@property(nonatomic, strong, readwrite) manager;
@end

@implementation Notification

+ (Notification *) notificationManager {
    static Notification * manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[Notification alloc] init];
    });
    return manager;
}

- (void) checkNotificationAuthorization {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound)
     completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"requestAuthorizationWithOptions finish");
        if (granted) {
//            [self _localNotification];
        }
    }];
}

- (void) _localNotification {
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @(1);
    content.title = @"测试通知标题";
    content.subtitle = @"this is subtitle";
    content.body = @"开发 iOS App";
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3.f repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest
                                      requestWithIdentifier:@"_pushLocalNotification"
                                      content:content
                                      trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter]
     addNotificationRequest:request
     withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"addNotificationRequest finish");
    }];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    completionHandler(UNNotificationPresentationOptionList | UNNotificationPresentationOptionBanner);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    // TODO
    completionHandler();
}


@end
