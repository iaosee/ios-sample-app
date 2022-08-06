//
//  ListLoader.h
//  SampleApp
//
//  Created by 肖峰 on 2022/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ListItem;

typedef void(^ListLoaderFinishBlock)(BOOL success, NSArray<ListItem *> *dataArray);

@interface ListLoader : NSObject

- (void) loadListData;
- (void) loadListDataWithFinishBlock:(ListLoaderFinishBlock) finsihBlock;

@end

NS_ASSUME_NONNULL_END
