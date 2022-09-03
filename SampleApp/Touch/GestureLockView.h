//
//  GestureLockView.h
//  SampleApp
//
//  Created by xiaofeng on 2022/9/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GestureLockViewDelegate <NSObject>

- (BOOL) verifyPassword:(NSString *) password;

@optional
- (void) verifyFinish;

@end

@interface GestureLockView : UIView

@property(nonatomic, weak) id delegate;
@property(nonatomic, copy) BOOL (^verifyPasswordBlock)(NSString * password);

@end

NS_ASSUME_NONNULL_END
