//
//  Mediator.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/9.
//

#import "Mediator.h"

@implementation Mediator

//target action
+ (__kindof UIViewController *)detailViewControllerWithUrl: (NSString *) url {
    Class detailCls = NSClassFromString(@"DetailViewController");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrl:") withObject:url];
#pragma clang diagnostic pop
    return controller;
}


// url scheme
+ (NSMutableDictionary *) mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

+ (void) registerScheme:(NSString *)scheme processBlock:(MediatorProcessBlock) processBlock {
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}
+ (void) openUrl: (NSString *)url params:(NSDictionary *)params {
    MediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

// protocal scheme
+ (void) registerProtocol:(Protocol *)proto cls:(Class) cls {
    if (proto && cls) {
        [[[self class] mediatorCache] setObject:cls forKey:NSStringFromProtocol(proto)];
    }
}
+ (Class) classForProtocol:(Protocol *)proto {
    return [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(proto)];
}

@end
