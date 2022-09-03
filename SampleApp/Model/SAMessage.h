//
//  SAMessage.h
//  SampleApp
//
//  Created by iaosee on 2022/8/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    MessageTypeTo = 0,
    MessageTypeFrom = 1,
} MessageType;

@interface SAMessage : NSObject

@property(nonatomic, copy) NSString *text;
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, assign) MessageType type;
@property(nonatomic, assign) BOOL hiddenTime;

- (instancetype) initWithDict:(NSDictionary *) dict;
+ (instancetype) messageWithDict:(NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
