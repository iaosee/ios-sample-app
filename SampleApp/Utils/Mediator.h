//
//  Mediator.h
//  SampleApp
//
//  Created by 肖峰 on 2022/8/9.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//常用的三种组件化方案

NS_ASSUME_NONNULL_BEGIN


@protocol DetailViewControllerProtocol <NSObject>
- (__kindof UIViewController *) initWithUrl:(NSString *)detailUrl;
@end


@interface Mediator : NSObject

//target action
+ (__kindof UIViewController *) detailViewControllerWithUrl: (NSString *) url;

//url scheme
typedef void(^MediatorProcessBlock)(NSDictionary *params);
+ (void) registerScheme:(NSString *)scheme processBlock:(MediatorProcessBlock) processBlock;
+ (void) openUrl: (NSString *)url params:(NSDictionary *)params;

//protocol class
+ (void) registerProtocol:(Protocol *)proto cls:(Class) cls;
+ (Class) classForProtocol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END
