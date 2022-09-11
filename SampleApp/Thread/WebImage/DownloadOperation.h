//
//  DownloadOperation.h
//  SampleApp
//
//  Created by iaosee on 2022/9/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DownloadOperation : NSOperation

@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) void (^finishedBlock)(UIImage *img);

+ (instancetype) downloadOperationWithURLString:(NSString *)url finishedBlock:(void (^)(UIImage *img)) finishedBlock;

@end

NS_ASSUME_NONNULL_END
