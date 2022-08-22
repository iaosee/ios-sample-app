//
//  SAMessageFrame.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/21.
//

#import <UIKit/UIKit.h>
#import "SAMessageFrame.h"
#import "SAMessage.h"
#import "NSString+TextSize.h"

@implementation SAMessageFrame

- (void)setMessage:(SAMessage *)message {
    _message = message;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat margin = 10;
    
    CGFloat timeW = screenW;
    CGFloat timeH = 0;
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    if (!message.hiddenTime) {
        timeH = 15;
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }

    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat iconX = message.type == MessageTypeFrom ? margin : screenW - margin - iconW;
    CGFloat iconY = CGRectGetMaxY(_timeFrame) + margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);

    CGSize textSize = [message.text sizeOfTextWithMaxSize:CGSizeMake(200, MAXFLOAT) font:textFont];
    CGFloat textW = textSize.width + 20;
    CGFloat textH = textSize.height + 20;
    CGFloat textX = message.type == MessageTypeFrom ? CGRectGetMaxX(_iconFrame) + margin : screenW - margin - iconW - textW - margin;
    CGFloat textY = iconY;
    _textFrame = CGRectMake(textX, textY, textW, textH);
    
    _rowHeight = MAX(CGRectGetMaxY(_textFrame), CGRectGetMaxY(_iconFrame)) + margin;
}


@end
