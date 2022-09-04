//
//  DrawingboardView.h
//  SampleApp
//
//  Created by xiaofeng on 2022/9/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawingboardView : UIView

@property(nonatomic, assign) CGFloat lineWidth;
@property(nonatomic, weak) UIColor *lineColor;

- (void) clear;
- (void) revoke;
@end

@interface ColorablePath : UIBezierPath
@property(nonatomic, weak) UIColor *lineColor;
@end

NS_ASSUME_NONNULL_END
