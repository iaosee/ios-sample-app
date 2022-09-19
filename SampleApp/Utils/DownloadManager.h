//
//  DownloadManager.h
//  SampleApp
//
//  Created by xiaofeng on 2022/9/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DownloadManager : NSObject

+ (instancetype) sharedManager;
- (void) download:(NSString *) urlString
     successBlock:(void(^)(NSString *path)) successBlock
    progressBlock:(void(^)(float progress))progressBlock
       errorBlock:(void(^)(NSError *error)) errorBlock;
- (void) pauseTaskForUrl:(NSString *)urlString;
@end

NS_ASSUME_NONNULL_END
