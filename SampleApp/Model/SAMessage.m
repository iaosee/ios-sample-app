//
//  SAMessage.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/21.
//

#import "SAMessage.h"

@implementation SAMessage

- (instancetype) initWithDict:(NSDictionary *) dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype) messageWithDict:(NSDictionary *) dict {
    return [[self alloc] initWithDict:dict];
}

@end
