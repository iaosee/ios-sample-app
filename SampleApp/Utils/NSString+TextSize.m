//
//  NSString+TextSize.m
//  SampleApp
//
//  Created by iaosee on 2022/8/22.
//

#import "NSString+TextSize.h"

@implementation NSString (TextSize)

- (CGSize) sizeOfTextWithMaxSize: (CGSize) maxSize font:(UIFont *)font {
    NSDictionary *attrs = @{NSFontAttributeName: font};
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs context:nil].size;
}

+ (CGSize) sizeWithText: (NSString *)text maxSize: (CGSize) maxSize font: (UIFont *)font {
    return [text sizeOfTextWithMaxSize:maxSize font:font];
}
@end
