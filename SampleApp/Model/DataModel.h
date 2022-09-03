//
//  DataModel.h
//  SampleApp
//
//  Created by iaosee on 2022/8/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataModel : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSNumber *count;
@property(nonatomic, copy) NSNumber *price;

- (instancetype) initWithDict: (NSDictionary *) dict;
+ (instancetype) dataWithDict: (NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
