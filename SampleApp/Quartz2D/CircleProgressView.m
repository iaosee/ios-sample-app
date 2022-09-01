//
//  CircleProgressView.m
//  SampleApp
//
//  Created by xiaofeng on 2022/9/1.
//

#import "CircleProgressView.h"

@implementation CircleProgressView

- (void)setValue:(float) value {
    _value = value;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    与 HTML Canvas 差不多
/**
 [ a  c  e ]
 [ b  d  f ]
 [ 0  0  1]
 */
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextRotateCTM(ctx, M_PI_4);
//    CGContextScaleCTM(ctx, 1.2, 1.2);
//    CGContextTranslateCTM(ctx, 100, 100);
//    CGContextSaveGState(ctx);
//    CGContextRestoreGState(ctx);
//    CGAffineTransform t = CGContextGetTextMatrix(ctx);
    
    float radius = MIN(self.bounds.size.width, self.bounds.size.height) / 2;
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:radius
                                                    startAngle:0 - M_PI_2
                                                      endAngle:2 * M_PI * self.value - M_PI_2
                                                     clockwise:YES];
    [path addLineToPoint:center];
    
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] = {
        255.0 / 255.0, 0 / 255.0, 0 / 255.0, 1.00,
        0 / 255.0,  0 / 255.0, 255.0 / 255.0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    CGPoint start = center;
    CGPoint end = center;
//    CGContextDrawLinearGradient(ctx, gradient, start, end, kCGGradientDrawsBeforeStartLocation);
    CGContextDrawRadialGradient(ctx, gradient, start, 0, end, radius, kCGGradientDrawsBeforeStartLocation);

    [[UIColor blueColor] set];
    [path fill];
}


@end
