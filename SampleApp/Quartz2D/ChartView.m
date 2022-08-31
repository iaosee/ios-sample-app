//
//  ChartView.m
//  SampleApp
//
//  Created by iaosee on 2022/8/31.
//

#import "ChartView.h"

@implementation ChartView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSArray *arr = @[ @0.3, @0.1, @0.2, @0.4 ];
    
    float side = MIN(self.bounds.size.width, self.bounds.size.height);
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    CGFloat start = 0;
    CGFloat end = 0;
    for (int i = 0; i < arr.count; i++) {
        end = start + M_PI * 2 * [arr[i] floatValue];
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:side / 2
                                                        startAngle:start
                                                          endAngle:end
                                                         clockwise:YES];
        [path addLineToPoint:center];
        
        [[UIColor colorWithRed:arc4random_uniform(256) / 255. green:arc4random_uniform(256) / 255. blue:arc4random_uniform(256) / 255. alpha:1.0] set];
        [path fill];
        start = end;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
//    [self setNeedsDisplayInRect:CGRectMake(0, 0, 200, 200)];
}
@end
