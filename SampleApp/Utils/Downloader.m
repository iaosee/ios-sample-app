//
//  Downloader.m
//  SampleApp
//
//  Created by xiaofeng on 2022/9/14.
//

#import "Downloader.h"

@interface Downloader () <NSURLConnectionDataDelegate>
@property(nonatomic, assign) long long expectedContentLength;
@property(nonatomic, assign) long long currentContentLength;
@property(nonatomic, strong) NSOutputStream *outputStream;
@property(nonatomic, strong) NSURLConnection *conn;
@property(nonatomic, copy) NSString *filename;
@property(nonatomic, copy) NSString *urlString;

@property(nonatomic, copy) void(^successBlock)(NSString *path);
@property(nonatomic, copy) void(^progressBlock)(float progress);
@property(nonatomic, copy) void(^errorBlock)(NSError *error);

@end

@implementation Downloader

- (void)main {
    @autoreleasepool {
        
        NSURL *url = [NSURL URLWithString:self.urlString];
        [self getServerFileInfo:url];
        
        if (self.isCancelled) {
            return;
        }
        
        self.currentContentLength = [self checkLocalFileInfo];
        if (self.currentContentLength == -1) {
            NSLog(@"Already downloaded !!!");
            if (self.successBlock) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.successBlock(self.filename);
                });
            }
            return;
        }

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setValue:[NSString stringWithFormat:@"bytes=%lld-", self.currentContentLength] forHTTPHeaderField:@"Range"];
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        self.conn = conn;
        [[NSRunLoop currentRunLoop] run];
    }
}

+ (instancetype) downloader:(NSString *) urlString
     successBlock:(void(^)(NSString *path)) successBlock
    progressBlock:(void(^)(float progress)) progressBlock
       errorBlock:(void(^)(NSError *error)) errorBlock {
    
    Downloader *downloer = [[Downloader alloc] init];

    downloer.urlString = urlString;
    downloer.successBlock = successBlock;
    downloer.progressBlock = progressBlock;
    downloer.errorBlock = errorBlock;

//    [self downloadFile:url];
    return downloer;
}

- (void) pause {
    [self.conn cancel];
    [self cancel];
}

- (void) downloadFile:(NSURL *) url {
    [[NSOperationQueue new] addOperationWithBlock:^{
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setValue:[NSString stringWithFormat:@"bytes=%lld-", self.currentContentLength] forHTTPHeaderField:@"Range"];
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        self.conn = conn;
        [[NSRunLoop currentRunLoop] run];
    }];
}

- (void) getServerFileInfo:(NSURL *) url {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"HEAD";
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    self.expectedContentLength = response.expectedContentLength;
    self.filename = [NSTemporaryDirectory() stringByAppendingPathComponent:response.suggestedFilename];
    NSLog(@"%@ , %lld", response.suggestedFilename, response.expectedContentLength);
}

- (long long) checkLocalFileInfo {
    long long fileSize = 0;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self.filename]) {
        NSDictionary *attrs = [fileManager attributesOfItemAtPath:self.filename error:NULL];
        fileSize = attrs.fileSize;

        if (fileSize == self.expectedContentLength) {
            fileSize = -1;
        }
        if (fileSize > self.expectedContentLength) {
            fileSize = 0;
            [fileManager removeItemAtPath:self.filename error:NULL];
        }
    }
    return fileSize;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.outputStream = [NSOutputStream outputStreamToFileAtPath:self.filename append:YES];
    [self.outputStream open];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.currentContentLength += data.length;
    float progress = self.currentContentLength * 1.0 / self.expectedContentLength;
//    NSLog(@"progress - %f", progress);
    [self.outputStream write:data.bytes maxLength:data.length];
    
    if (self.progressBlock) {
        self.progressBlock(progress);
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.outputStream close];
//    NSLog(@"FinishLoading. %@, %lld", [self.filename lastPathComponent], self.currentContentLength);
    if (self.successBlock) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.successBlock(self.filename);
        });
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if (self.errorBlock) {
        self.errorBlock(error);
    }
}
@end
