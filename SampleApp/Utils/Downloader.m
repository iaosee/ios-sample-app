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
@property(nonatomic, copy) NSString *filename;
@end

@implementation Downloader

- (void) download:(NSString *) urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    
    [self getServerFileInfo:url];
    self.currentContentLength = [self checkLocalFileInfo];
    if (self.currentContentLength == -1) {
        NSLog(@"Already downloaded !!!");
        return;
    }
    [self downloadFile:url];
}

- (void) downloadFile:(NSURL *) url {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:[NSString stringWithFormat:@"bytes=%lld-", self.currentContentLength] forHTTPHeaderField:@"Range"];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
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
    NSLog(@"progress - %f", progress);
    [self.outputStream write:data.bytes maxLength:data.length];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.outputStream close];
    NSLog(@"FinishLoading. %@, %lld", [self.filename lastPathComponent], self.currentContentLength);
}
@end
