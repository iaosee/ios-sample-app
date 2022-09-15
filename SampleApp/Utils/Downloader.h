//
//  Downloader.h
//  SampleApp
//
//  Created by xiaofeng on 2022/9/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Downloader : NSObject
- (void) download:(NSString *) urlString;
@end

NS_ASSUME_NONNULL_END
