//
//  DynamicViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/9/4.
//

#import "DynamicViewController.h"
@interface MyView : UIView
@property(nonatomic, assign) CGRect rect;
@end
@implementation MyView
- (void)drawRect:(CGRect)rect {
    [[UIBezierPath bezierPathWithRect:self.rect] stroke];
}
@end

@interface DynamicViewController ()
@property (nonatomic, weak) UIView *redView;
@property (nonatomic, weak) UIView *greenView;
@property (nonatomic, weak) UIView *blueView;
@property (nonatomic, weak) UIView *yellowView;
@property (nonatomic, assign) CGPoint pos;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation DynamicViewController

- (void)loadView {
    self.view = [[MyView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.frame = CGRectMake(150, self.view.bounds.size.height / 2, 60, 60);
    [self.view addSubview:greenView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.frame = CGRectMake(10, 300, 200, 10);
    blueView.transform = CGAffineTransformMakeRotation(M_PI_4 / 2);
    [self.view addSubview:blueView];
    
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    yellowView.frame = CGRectMake(250, 100, 100, 50);
    [self.view addSubview:yellowView];

    self.redView = redView;
    self.greenView = greenView;
    self.blueView = blueView;
    self.yellowView = yellowView;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [self dynamicAnimate];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    self.pos = p;
    
    [self dynamicAnimate];
}

- (void) dynamicAnimate {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView, self.yellowView]];
    gravity.gravityDirection = CGVectorMake(0, 1);
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[
        self.redView, self.greenView, self.blueView, self.yellowView,
    ]];
    collision.collisionMode = UICollisionBehaviorModeItems;
    collision.collisionMode = UICollisionBehaviorModeBoundaries;
    collision.collisionMode = UICollisionBehaviorModeEverything;
    collision.translatesReferenceBoundsIntoBoundary = YES;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.greenView.frame];
    [collision addBoundaryWithIdentifier:@"key-Identifier" forPath:path];
//    [collision addBoundaryWithIdentifier:@"key-Identifier"
//                               fromPoint:CGPointMake(10, 300)
//                                 toPoint:CGPointMake(200, 350)];
    collision.action = ^{
        MyView *view = (MyView *) self.view;
        view.rect = self.redView.frame;
        [self.view setNeedsDisplay];
    };
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.redView snapToPoint:self.pos];
    snap.damping = 0.5;
//    UISnapBehavior *snap2 = [[UISnapBehavior alloc] initWithItem:self.yellowView snapToPoint:self.pos];

    [animator addBehavior:gravity];
    [animator addBehavior:collision];
    [animator addBehavior:snap];
    
    self.animator = animator;
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
