//
//  NSString+Sandbox.h
//  SampleApp
//
//  Created by xiaofeng on 2022/9/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Sandbox)

- (instancetype) appendTemp;
- (instancetype) appendCache;
- (instancetype) appendDocument;

@end

NS_ASSUME_NONNULL_END
