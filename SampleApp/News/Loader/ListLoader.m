//
//  ListLoader.m
//  SampleApp
//
//  Created by iaosee on 2022/8/5.
//

#import <AFNetworking.h>
#import "ListLoader.h"
#import "ListItem.h"

@implementation ListLoader

- (void) loadListData {
    [self loadListDataNS:^(BOOL success, NSArray<ListItem *> * _Nonnull dataArray) {
//        NSLog(@"%@", dataArray);
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
    NSArray<ListItem *> *listData = [self _readDataFromLocal];
    if (listData) {
        finsihBlock(YES, listData);
    }

    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *listUrl = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listUrl];
    
    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionTask *dataTask = [session dataTaskWithRequest:listRequest];
//    NSLog(@"%@", dataTask);

    __weak typeof(self) weakSelf = self;
    NSURLSessionTask *dataTask = [session dataTaskWithURL:listUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = self;
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
        
        [strongSelf _archiveListDataWithArray:listArray];
//        NSLog(@"listArray - %@", listArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finsihBlock) {
                finsihBlock(error == nil, listArray);
            }
        });
    }];

    [dataTask resume];
}

- (void) _archiveListDataWithArray: (NSArray<ListItem *> *)array {
    NSArray<NSString *> *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // create directory
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"XFDdata"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:nil];
    
    if (createError != nil) {
        NSLog(@"Error - %@", createError);
        return;
    }
    
    // create file with content
    NSString *listDataFile = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:listDataFile contents:listData attributes:nil];
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataFile];

    // append content to file
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataFile];
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandle synchronizeFile];
//    [fileHandle closeFile];
}

- (NSArray<ListItem *> *) _readDataFromLocal {
    NSArray<NSString *> *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *listDataFile = [cachePath stringByAppendingPathComponent:@"XFDdata/list"];
    NSData *readListData = [fileManager contentsAtPath:listDataFile];
    NSArray<ListItem *> *unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [ListItem class], nil]
                                      fromData:readListData
                                         error:nil];

    if ([unarchiveObj isKindOfClass:[NSArray class]] && unarchiveObj.count > 0) {
        return unarchiveObj;
    }
    
    return nil;
}

@end
