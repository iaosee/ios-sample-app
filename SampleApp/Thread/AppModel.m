//
//  AppModel.m
//  SampleApp
//
//  Created by iaosee on 2022/9/10.
//

#import "AppModel.h"

@implementation AppModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (NSArray<AppModel *> *)apps {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"app-list.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *apps = [NSMutableArray arrayWithCapacity:10];

    [arr enumerateObjectsUsingBlock:^(NSDictionary* _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [apps addObject:[self appWithDict:obj]];
    }];

    return apps.copy;
}
@end
