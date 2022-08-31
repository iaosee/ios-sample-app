//
//  DrawingView.m
//  SampleApp
//
//  Created by iaosee on 2022/8/31.
//

#import "DrawingView.h"

@implementation DrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    [self drawRect01];
//    [self drawRect02];
//    [self drawRect03];
//    [self drawRect04];
    [self drawRect05];

}
- (void)drawRect05 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 10)];
    [path addLineToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 30)];
    [path addLineToPoint:CGPointMake(200, 80)];
    [path stroke];
    
    [[UIBezierPath bezierPathWithRect:CGRectMake(20, 100, 50, 50)] stroke];
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(80, 100, 50, 50) cornerRadius:10] stroke];
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(140, 100, 50, 50) cornerRadius:25] stroke];
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(200, 100, 100, 50) cornerRadius:10] stroke];
    
    
    [[UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 160, 100, 50)] stroke];
    [[UIBezierPath bezierPathWithOvalInRect:CGRectMake(140, 160, 50, 50)] stroke];
    CGContextAddEllipseInRect(ctx, CGRectMake(200, 160, 100, 50));
    CGContextStrokePath(ctx);
    
    [[UIBezierPath bezierPathWithArcCenter:CGPointMake(70, 300)
                                    radius:50.
                                startAngle:0
                                  endAngle:M_PI
                                 clockwise:YES] stroke];
    [[UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 300)
                                    radius:50.
                                startAngle:0
                                  endAngle:M_PI*2
                                 clockwise:YES] stroke];

    UIBezierPath *triangle = [UIBezierPath bezierPath];
    [triangle moveToPoint:CGPointMake(50, 400)];
    [triangle addLineToPoint:CGPointMake(100, 450)];
    [triangle addLineToPoint:CGPointMake(100, 400)];
    [triangle closePath];
    triangle.lineWidth = 5;
    [[UIColor redColor] setStroke];
    [triangle stroke];
    
    UIBezierPath *triangle2 = [UIBezierPath bezierPath];
    [triangle2 moveToPoint:CGPointMake(150, 400)];
    [triangle2 addLineToPoint:CGPointMake(200, 450)];
    [triangle2 addLineToPoint:CGPointMake(200, 400)];
    [triangle2 closePath];
    triangle2.lineWidth = 5;
    [[UIColor redColor] setFill];
    [[UIColor greenColor] setStroke];
    [triangle2 stroke];
    [triangle2 fill];
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 500)
                                    radius:30.
                                startAngle:0
                                  endAngle:M_PI * 2
                                 clockwise:YES];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 500)
                                    radius:50.
                                startAngle:0
                                  endAngle:M_PI * 2
                                 clockwise:NO];
    CGContextAddPath(ctx, path1.CGPath);
    CGContextAddPath(ctx, path2.CGPath);
    CGContextDrawPath(ctx, kCGPathFill);

}

- (void)drawRect04 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 10, 10);
    CGPathAddLineToPoint(path, NULL, 50, 100);
    CGPathAddLineToPoint(path, NULL, 100, 50);
    
    UIBezierPath *bPath = [UIBezierPath bezierPathWithCGPath:path];
    [bPath addLineToPoint:CGPointMake(200, 50)];
    CGContextAddPath(ctx, bPath.CGPath);

    CGContextStrokePath(ctx);
}
- (void)drawRect03 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(50, 100)];
    [path addLineToPoint:CGPointMake(100, 50)];
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextStrokePath(ctx);
}
- (void)drawRect02 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 10, 10);
    CGPathAddLineToPoint(path, NULL, 50, 100);
    CGPathAddLineToPoint(path, NULL, 100, 50);
    CGContextAddPath(ctx, path);

    CGContextStrokePath(ctx);
}
- (void)drawRect01 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddLineToPoint(ctx, 50, 100);
    CGContextAddLineToPoint(ctx, 100, 50);

    CGContextStrokePath(ctx);
}


@end
