//
//  NSString+Sandbox.m
//  SampleApp
//
//  Created by iaosee on 2022/9/10.
//

#import "NSString+Sandbox.h"

@implementation NSString (Sandbox)

- (instancetype) appendTemp {
    NSString *path = NSTemporaryDirectory();
    return [path stringByAppendingPathComponent:self.lastPathComponent];
}
- (instancetype) appendCache {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [path stringByAppendingPathComponent:self.lastPathComponent];
}
- (instancetype) appendDocument {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [path stringByAppendingPathComponent:self.lastPathComponent];
}

@end
