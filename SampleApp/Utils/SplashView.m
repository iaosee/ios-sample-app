//
//  SplashView.m
//  SampleApp
//
//  Created by iaosee on 2022/8/8.
//

#import "SplashView.h"

@interface SplashView()

@property(nonatomic, strong, readwrite) UIButton *button;

@end

@implementation SplashView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
        self.contentMode = UIViewContentModeScaleAspectFill;
//        self.backgroundColor = [UIColor blueColor];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:CGRectMake(300, 100, 60, 40 )];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self
                        action:@selector(_removeSplashView)
              forControlEvents: UIControlEventTouchUpInside];
            _button;
        })];
        
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

- (void) _removeSplashView {
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
