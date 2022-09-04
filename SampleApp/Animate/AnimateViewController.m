//
//  AnimateViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/9/4.
//

#import "AnimateViewController.h"

@interface AnimateViewController ()

@property(nonatomic, weak) CALayer *layer;

@end

@implementation AnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 50, 50)];
    view.backgroundColor = [UIColor blueColor];

    [self.view addSubview:view];
    self.layer = view.layer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

//    [self baseAnimate];
//    [self keyAnimate];
    [self groupAnimate];
}
- (void) groupAnimate {
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    
    CABasicAnimation *animate1 = [[CABasicAnimation alloc] init];
    animate1.keyPath = @"transform.rotation";
    animate1.byValue = @(2 * M_PI * 3);
    
    CAKeyframeAnimation *animate2 = [[CAKeyframeAnimation alloc] init];
    animate2.keyPath = @"position";
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 300) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    animate2.path = path.CGPath;
    
    
    group.duration = 2;
    group.repeatCount = 10;
    group.animations = @[animate1, animate2];
    
    [self.layer addAnimation:group forKey:nil];
}
- (void) keyAnimate {
    CAKeyframeAnimation *animate = [[CAKeyframeAnimation alloc] init];
    animate.keyPath = @"position";
    animate.values = @[
        [NSValue valueWithCGPoint:CGPointMake(100, 100)],
        [NSValue valueWithCGPoint:CGPointMake(300, 100)],
        [NSValue valueWithCGPoint:CGPointMake(100, 300)],
        [NSValue valueWithCGPoint:CGPointMake(300, 300)],
    ];
    animate.duration = 2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 300) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    animate.path = path.CGPath;
    
    animate.fillMode = kCAFillModeForwards;
    animate.removedOnCompletion = NO;
    
    [self.layer addAnimation:animate forKey:nil];
}
- (void) baseAnimate {
    CABasicAnimation *animate = [[CABasicAnimation alloc] init];
    animate.keyPath = @"position.x";
    animate.fromValue = @(10);
    animate.toValue = @(300);
//    animate.byValue = @(10);
    animate.fillMode = kCAFillModeForwards;
    animate.removedOnCompletion = NO;

    [self.layer addAnimation:animate forKey:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
