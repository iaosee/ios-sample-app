//
//  ListLoader.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/5.
//

#import <AFNetworking.h>"
#import "ListLoader.h"
#import "ListItem.h"

@implementation ListLoader

- (void) loadListData {
    [self loadListDataNS:^(BOOL success, NSArray<ListItem *> * _Nonnull dataArray) {
        NSLog(@"%@", dataArray);
    }];
}

- (void)loadListDataWithFinishBlock:(ListLoaderFinishBlock)finsihBlock {
    [self loadListDataNS:finsihBlock];
}

- (void) loadListDataAF:(ListLoaderFinishBlock)finsihBlock {
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *listUrl = [NSURL URLWithString:urlString];
    
    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"progress - %@", downloadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"success - %@", responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"failure - %@", error);
    }];
}

- (void) loadListDataNS:(ListLoaderFinishBlock)finsihBlock {
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    
    NSURL *listUrl = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listUrl];
    
    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionTask *dataTask = [session dataTaskWithRequest:listRequest];
//    NSLog(@"%@", dataTask);

    NSURLSessionTask *dataTask = [session dataTaskWithURL:listUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError = nil;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
//        NSLog(@"jsonObj - %@", jsonObj);
        
        #warning type checkeck
        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *) jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listArray = @[].mutableCopy;
        
        for (NSDictionary *info in dataArray) {
            ListItem *item = [[ListItem alloc] init];
            [item configWithDictionary:info];
            [listArray addObject:item];
        }
//        NSLog(@"listArray - %@", listArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finsihBlock) {
                finsihBlock(error == nil, listArray);
            }
        });
    }];

    [dataTask resume];
}

@end
