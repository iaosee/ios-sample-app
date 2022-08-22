//
//  NSString+TextSize.h
//  SampleApp
//
//  Created by xiaofeng on 2022/8/22.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TextSize)

- (CGSize) sizeOfTextWithMaxSize: (CGSize) maxSize font:(UIFont *)font;

+ (CGSize) sizeWithText: (NSString *)text maxSize: (CGSize) maxSize font: (UIFont *)font;

@end

NS_ASSUME_NONNULL_END
