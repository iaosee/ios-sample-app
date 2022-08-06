//
//  ListItem.h
//  SampleApp
//
//  Created by xiaofeng on 2022/8/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListItem : NSObject <NSSecureCoding>

@property(nonatomic, strong, readwrite) NSString *category;
@property(nonatomic, strong, readwrite) NSString *picUrl;
@property(nonatomic, strong, readwrite) NSString *uniqueKey;
@property(nonatomic, strong, readwrite) NSString *title;
@property(nonatomic, strong, readwrite) NSString *date;
@property(nonatomic, strong, readwrite) NSString *authorName;
@property(nonatomic, strong, readwrite) NSString *articleUrl;

- (void) configWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
