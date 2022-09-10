//
//  AppModel.h
//  SampleApp
//
//  Created by xiaofeng on 2022/9/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppModel : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *desc;
@property(nonatomic, copy) NSString *iconUrl;
@property(nonatomic, strong) NSArray<NSString *> *screenshots;

- (instancetype) initWithDict: (NSDictionary *)dict;
+ (instancetype) appWithDict: (NSDictionary *)dict;
+ (NSArray<AppModel *> *) apps;

@end

NS_ASSUME_NONNULL_END
