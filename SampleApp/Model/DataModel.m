//
//  DataModel.m
//  SampleApp
//
//  Created by iaosee on 2022/8/20.
//

#import "DataModel.h"

@implementation DataModel

- (instancetype) initWithDict: (NSDictionary *) dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype) dataWithDict: (NSDictionary *) dict {
    return [[self alloc] initWithDict:dict];
}

@end
