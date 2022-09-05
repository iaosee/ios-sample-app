//
//  DrawingboardView.m
//  SampleApp
//
//  Created by iaosee on 2022/9/4.
//

#import "DrawingboardView.h"

@implementation ColorablePath
@end

@interface DrawingboardView ()
@property(nonatomic, strong) NSMutableArray<ColorablePath *>* paths;
@end

@implementation DrawingboardView

- (NSMutableArray*)paths {
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}
- (CGFloat)lineWidth {
    if (!_lineWidth) {
        _lineWidth = 2;
    }
    return _lineWidth;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    ColorablePath *path = [[ColorablePath alloc] init];
    [path moveToPoint:p];
    [path setLineWidth:self.lineWidth];
    [path setLineColor:self.lineColor];
    [self.paths addObject:path];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    
    [self.paths.lastObject addLineToPoint:p];
    [self setNeedsDisplay];
}

- (void) clear {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

- (void) revoke {
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    for (ColorablePath *path in self.paths) {
        [path setLineCapStyle:kCGLineCapRound];
        [path setLineJoinStyle:kCGLineJoinRound];
        [path.lineColor set];
        [path stroke];
    }
}

@end
