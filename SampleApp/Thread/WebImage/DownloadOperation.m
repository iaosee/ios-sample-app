//
//  DownloadOperation.m
//  SampleApp
//
//  Created by iaosee on 2022/9/11.
//

#import "DownloadOperation.h"
#import "NSString+Hash.h"
#import "NSString+Sandbox.h"

@implementation DownloadOperation

+ (instancetype)downloadOperationWithURLString:(NSString *)url finishedBlock:(void (^)(UIImage * img))finishedBlock {
    DownloadOperation *op = [[DownloadOperation alloc] init];
    op.url = url;
    op.finishedBlock = finishedBlock;
    return op;
}

- (void)main {
    @autoreleasepool {
        NSAssert(self.finishedBlock != nil, @"finishedBlock cannot be nil");
        if (self.isCancelled) {
            return;
        }
        NSLog(@"DownloadOperation downloading image...");

        [NSThread sleepForTimeInterval:5];
        NSURL *url = [NSURL URLWithString:self.url];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];

        if (img) {
            [data writeToFile:[[self.url SHA1] appendCache] atomically:YES];
        }

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (!img) {
                return;
            }
            self.finishedBlock(img);
        }];
    }
}

@end
