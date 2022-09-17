//
//  WebImageDownloadManager.h
//  SampleApp
//
//  Created by iaosee on 2022/9/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebImageDownloadManager : NSObject

+ (instancetype) sharedManager;

- (void) downloadWithURLString:(NSString *)url finishedBlock:(void (^)(UIImage *img)) finishedBlock;
- (void) cancelDownload:(NSString *) url;
@end

NS_ASSUME_NONNULL_END
