//
//  GestureLockView.m
//  SampleApp
//
//  Created by iaosee on 2022/9/3.
//

#import "GestureLockView.h"

#define ButtonCount 9

@interface GestureLockView ()

@property(nonatomic, strong) NSMutableArray<UIView *> *btns;
@property(nonatomic, strong) NSMutableArray<UIView *> *lines;
@property(nonatomic, assign) CGPoint lastPos;

@end

@implementation GestureLockView

- (NSMutableArray *)btns {
    if (!_btns) {
        _btns = [NSMutableArray array];
        
        for (int i = 0; i < ButtonCount; i++) {
            UIView *btn = [[UIView alloc] init];
            btn.tag = i;
            btn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5];
            btn.userInteractionEnabled = NO;
            [_btns addObject:btn];
            [self addSubview:btn];
        }
    }
    return _btns;
}
- (NSMutableArray *)lines {
    if (!_lines) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor clearColor];

    int colCount = 3;
    CGFloat w = 60;
    CGFloat h = w;
    CGFloat margin = (self.frame.size.width - 3 * w) / 4;
    for (int i = 0; i < self.btns.count; i++) {
        CGFloat x = (i % colCount) * (w + margin) + margin;
        CGFloat y = (i / colCount) * (h + margin) + margin;

        self.btns[i].layer.cornerRadius = w / 2;
        self.btns[i].layer.borderWidth = 5;
        self.btns[i].layer.borderColor = [[UIColor purpleColor] CGColor];
        [self.btns[i] setFrame:CGRectMake(x, y, w, h)];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"GestureLockView touchesBegan");
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    
    for (int i = 0; i < ButtonCount; i++) {
        UIView *btn = self.btns[i];
        if (CGRectContainsPoint(btn.frame, p)) {
            btn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.8];
            if (![self.lines containsObject:btn]) {
                [self.lines addObject:btn];
            }
        }
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    
    for (int i = 0; i < ButtonCount; i++) {
        UIView *btn = self.btns[i];
        if (CGRectContainsPoint(btn.frame, p)) {
            btn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.8];
            if (![self.lines containsObject:btn]) {
                [self.lines addObject:btn];
            }
        }
    }
    self.lastPos = p;
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.lastPos = [self.lines lastObject].center;
    [self setNeedsDisplay];
    self.userInteractionEnabled = NO;
    [self verifyPassword];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self clear];
        self.userInteractionEnabled = YES;
    });
}
- (void) verifyPassword {
    NSString *password = @"";
    for (int i = 0; i < self.lines.count; i++) {
        UIView* btn = self.lines[i];
        password = [password stringByAppendingString:[NSString stringWithFormat:@"%ld", btn.tag]];
    }

    if([self.delegate respondsToSelector:@selector(verifyPassword:) ]) {
        if ([self.delegate verifyPassword:password]) {
            [self correctStyle];
        } else {
            [self incorrectStyle];
        }
    }

    if (self.verifyPasswordBlock) {
        if (self.verifyPasswordBlock(password)) {
            [self correctStyle];
        } else {
            [self incorrectStyle];
        }
    }

    if([self.delegate respondsToSelector:@selector(verifyFinish)]) {
        [self.delegate verifyFinish];
    }
}
- (void) correctStyle {
    for (int i = 0; i < self.lines.count; i++) {
        UIView *btn = self.lines[i];
        btn.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.8];
    }
}
- (void) incorrectStyle {
    for (int i = 0; i < self.lines.count; i++) {
        UIView *btn = self.lines[i];
        btn.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.8];
    }
}
- (void) clear {
    for (int i = 0; i < ButtonCount; i++) {
        UIView *btn = self.btns[i];
        btn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5];
    }

    [self.lines removeAllObjects];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    if (!self.lines.count) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    for (int i = 0; i < self.lines.count; i++) {
        UIView *btn = self.lines[i];
        CGPoint center = btn.center;
        if (i == 0) {
            [path moveToPoint:center];
        } else {
            [path addLineToPoint:center];
        }
    }
    
    [path addLineToPoint:self.lastPos];

    [[UIColor whiteColor] set];
    [path setLineWidth:10];
    [path setLineCapStyle: kCGLineCapRound];
    [path setLineJoinStyle: kCGLineJoinRound];
    [path stroke];
}


@end
