//
//  DownloadManager.m
//  SampleApp
//
//  Created by iaosee on 2022/9/11.
//

#import "WebImageDownloadManager.h"
#import "DownloadOperation.h"
#import "NSString+Hash.h"
#import "NSString+Sandbox.h"

@interface WebImageDownloadManager ()
@property(nonatomic, strong) NSOperationQueue *queue;
@property(nonatomic, strong) NSMutableDictionary<NSString *, UIImage *> *imageCahce;
@property(nonatomic, strong) NSMutableDictionary<NSString *, NSOperation *> *operationCache;
@end

@implementation WebImageDownloadManager

- (NSOperationQueue *)queue {
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}
- (NSMutableDictionary<NSString *, UIImage *> *)imageCahce {
    if (_imageCahce == nil) {
        _imageCahce = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _imageCahce;
}
- (NSMutableDictionary<NSString *,NSOperation *> *)operationCache {
    if (_operationCache == nil) {
        _operationCache = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _operationCache;
}

+ (instancetype)sharedManager {
    static WebImageDownloadManager *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[WebImageDownloadManager alloc] init];
    });

    return instance;
}

- (void)downloadWithURLString:(NSString *)url finishedBlock:(void (^)(UIImage *))finishedBlock {
    NSAssert(finishedBlock != nil, @"finishedBlock cannot be nil");
    if (!url) {
        return;
    }

    if ([self isCached:url]) {
        finishedBlock(self.imageCahce[url]);
        return;
    }
    if (self.operationCache[url]) {
        NSLog(@"Already started download.");
        return;
    }

    NSOperation *op = [DownloadOperation downloadOperationWithURLString:url finishedBlock:^(UIImage * img) {
        NSLog(@"Downloading from network ...");
        finishedBlock(img);

        [self.imageCahce setValue:img forKey:url];
        [self.operationCache removeObjectForKey:url];
    }];

    [self.queue addOperation:op];
    [self.operationCache setValue:op forKey:url];
}

- (void)cancelDownload:(NSString *)url {
    if (!url) {
        return;
    }
    [self.operationCache[url] cancel];
    [self.operationCache removeObjectForKey:url];
}

- (BOOL) isCached:(NSString *)url {
    if (self.imageCahce[url]) {
        NSLog(@"Loading iamge from memory cache.");
        return YES;
    }
    NSData *imgData = [NSData dataWithContentsOfFile:[[url SHA1] appendCache]];
    UIImage *img = [UIImage imageWithData:imgData];
    if (img) {
        NSLog(@"Loading image from sandbox cache.");
        [self.imageCahce setValue:img forKey:url];
        return YES;
    }
    return NO;
}

@end
