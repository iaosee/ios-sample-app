//
//  SAMessageFrame.h
//  SampleApp
//
//  Created by xiaofeng on 2022/8/21.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

#define textFont [UIFont systemFontOfSize:14]

@class SAMessage;

@interface SAMessageFrame : NSObject

@property (nonatomic, strong) SAMessage * message;
@property (nonatomic, assign, readonly) CGRect timeFrame;
@property (nonatomic, assign, readonly) CGRect iconFrame;
@property (nonatomic, assign, readonly) CGRect textFrame;
@property (nonatomic, assign, readonly) CGFloat rowHeight;

@end

NS_ASSUME_NONNULL_END
