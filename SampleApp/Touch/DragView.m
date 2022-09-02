//
//  DragView.m
//  SampleApp
//
//  Created by xiaofeng on 2022/9/2.
//

#import "DragView.h"

@interface DragView ()

@property(nonatomic, assign) BOOL isDrag;

@end

@implementation DragView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = [touches anyObject];
    CGPoint currentPos = [t locationInView:self];
    CGPoint previousPos = [t previousLocationInView:self];
    CGFloat offsetX = currentPos.x - previousPos.x;
    CGFloat offsetY = currentPos.y - previousPos.y;

    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
