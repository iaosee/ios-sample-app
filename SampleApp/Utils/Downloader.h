//
//  Downloader.h
//  SampleApp
//
//  Created by xiaofeng on 2022/9/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Downloader : NSObject
- (void) download:(NSString *) urlString successBlock:(void(^)(NSString *path)) successBlock progressBlock:(void(^)(float progress))progressBlock errorBlock:(void(^)(NSError *error)) errorBlock;
- (void) pause;
@end

NS_ASSUME_NONNULL_END
