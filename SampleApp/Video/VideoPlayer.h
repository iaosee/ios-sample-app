//
//  VideoPlayer.h
//  SampleApp
//
//  Created by xiaofeng on 2022/8/7.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoPlayer : NSObject

+ (VideoPlayer *) Player;
- (void) playVideoWithUrl: (NSString *) videoUrl attachView: (UIView *) attachView;
- (void) stopPlay;

@end

NS_ASSUME_NONNULL_END
