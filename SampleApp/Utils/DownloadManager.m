//
//  DownloadManager.m
//  SampleApp
//
//  Created by xiaofeng on 2022/9/17.
//

#import "DownloadManager.h"
#import "Downloader.h"

@interface DownloadManager ()
@property(nonatomic, strong) NSMutableDictionary *downloadCache;
@end

@implementation DownloadManager

+ (instancetype)sharedManager {
    static DownloadManager *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[DownloadManager alloc] init];
    });

    return instance;
}

- (NSMutableDictionary *)downloadCache {
    if (_downloadCache == nil) {
        _downloadCache = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _downloadCache;
}

- (void) download:(NSString *) urlString
     successBlock:(void(^)(NSString *path)) successBlock
    progressBlock:(void(^)(float progress))progressBlock
       errorBlock:(void(^)(NSError *error)) errorBlock {

    if (self.downloadCache[urlString]) {
        NSLog(@"DownloadManager: Already downloaded !!!");
        return;
    }

//    Downloader *downloader = [[Downloader alloc] init];
    Downloader *downloader = [Downloader downloader:urlString
            successBlock:^(NSString *path) {
        [self.downloadCache removeObjectForKey:urlString];
        if (successBlock) {
            successBlock(path);
        }
    }
           progressBlock:progressBlock
              errorBlock:^(NSError *error) {
        [self.downloadCache removeObjectForKey:urlString];
        if (errorBlock) {
            errorBlock(error);
        }
    }];
    
    [[NSOperationQueue new] addOperation:downloader];
    [self.downloadCache setObject:downloader forKey:urlString];
}

- (void)pauseTaskForUrl:(NSString *)urlString {
    Downloader *downloder = self.downloadCache[urlString];
    if (downloder == nil) {
        return;
    }

    [downloder pause];
    [self.downloadCache removeObjectForKey:urlString];
}
@end
