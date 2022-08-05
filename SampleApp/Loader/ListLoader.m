//
//  ListLoader.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/5.
//

#import "ListLoader.h"

@implementation ListLoader

- (void) loadListData {
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    
    NSURL *listUrl = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listUrl];
    
    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionTask *dataTask = [session dataTaskWithRequest:listRequest];
//    NSLog(@"%@", dataTask);

    NSURLSessionTask *dataTask = [session dataTaskWithURL:listUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", data);
    }];
 
    [dataTask resume];
}

@end
