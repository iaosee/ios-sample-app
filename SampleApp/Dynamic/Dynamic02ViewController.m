//
//  Dynamic02ViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/9/5.
//

#import "Dynamic02ViewController.h"

@implementation XView
- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}
@end

@interface Dynamic02ViewController ()
@property (nonatomic, weak) UIView *redView;
@property (nonatomic, weak) UIView *greenView;
@property (nonatomic, assign) CGPoint pos;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attach;
@end

@implementation Dynamic02ViewController
- (void)loadView {
    self.view = [[XView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.8];
    redView.frame = CGRectMake(150, 200, 100, 100);
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.frame = CGRectMake(150, 400, 60, 60);
    [self.view addSubview:greenView];

    self.redView = redView;
    self.greenView = greenView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    self.pos = p;
    
    [self dynamicAnimate];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    
    self.attach.anchorPoint = p;
    
    __weak typeof (self) wself = self;
    self.attach.action = ^{
        UIBezierPath *path = [[UIBezierPath alloc] init];
        [path moveToPoint:p];
        [path addLineToPoint:wself.redView.center];
        [path addLineToPoint:wself.greenView.center];
        ((XView *)wself.view).path = path;
        [wself.view setNeedsDisplay];
    };
}

- (void) dynamicAnimate {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView, self.greenView]];
    gravity.gravityDirection = CGVectorMake(0, 1);
    
    UIAttachmentBehavior *attach = [[UIAttachmentBehavior alloc] initWithItem:self.redView attachedToAnchor:self.pos];
    attach.damping = 0.5;
    attach.frequency = 0.5;
    UIAttachmentBehavior *attach2 = [[UIAttachmentBehavior alloc] initWithItem:self.greenView attachedToItem:self.redView];
    attach2.damping = 1;
    attach2.frequency = 0.9;

    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView, self.greenView]];
//    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    [animator addBehavior:gravity];
    [animator addBehavior:collision];
    [animator addBehavior:attach];
    [animator addBehavior:attach2];
    
    self.attach = attach;
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
