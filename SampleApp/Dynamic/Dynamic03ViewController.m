//
//  Dynamic03ViewController.m
//  SampleApp
//
//  Created by xiaofeng on 2022/9/6.
//

#import "Dynamic03ViewController.h"
#import "Dynamic02ViewController.h"

#define ITEM_COUNT 10

@interface Dynamic03ViewController ()
@property(nonatomic, strong) NSMutableArray<UIView *> *bodys;
@property(nonatomic, strong) UIDynamicAnimator *animator;
@property(nonatomic, strong) UIAttachmentBehavior *atta;
@end

@implementation Dynamic03ViewController

- (NSMutableArray<UIView *> *)bodys {
    if(!_bodys) {
        _bodys = [NSMutableArray array];
    }
    return _bodys;
}

- (void)dealloc {
    NSLog(@"%@ dealloc", [self class]);
}

- (void)loadView {
    self.view = [[XView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    CGFloat w = 30;
    CGFloat h = 30;
    
    for (int i = 0; i < ITEM_COUNT; i++) {
        UIView *item = [[UIView alloc] init];
        CGFloat x = i * w;
        CGFloat y = 300;
        
        item.frame = CGRectMake(x, y, w, h);
        item.backgroundColor = [UIColor blueColor];
        item.layer.cornerRadius = w * 0.5;
        item.layer.masksToBounds = YES;
        
        [self.bodys addObject:item];
        [self.view addSubview:item];
    }
    
    
    UIView *head = [self.bodys lastObject];
    head.frame = CGRectMake(head.frame.origin.x, head.frame.origin.y - w * 0.5, w * 2, h * 2);
    head.layer.cornerRadius = head.frame.size.width * 0.5;
    head.backgroundColor = [UIColor redColor];
    [head addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(headPanAction:)]];
    
    
    for (int i = 0; i < ITEM_COUNT - 1; i++) {
        UIView *item = self.bodys[i];
        UIView *attachToItem = self.bodys[i + 1];
        UIAttachmentBehavior *atta = [[UIAttachmentBehavior alloc] initWithItem:item attachedToItem:attachToItem];
//        atta.damping = 0.5;
//        atta.frequency = 1;
        [self.animator addBehavior:atta];
        
    }

    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:self.bodys];
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:self.bodys];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    for (int i = 0; i < ITEM_COUNT - 1; i++) {
        UIView *item = self.bodys[i];
        UIView *attachToItem = self.bodys[i + 1];
        if (i == 0) {
            [path moveToPoint:item.center];
        } else {
            [path addLineToPoint:attachToItem.center];
        }
    }
    ((XView *)self.view).path = path;
    [self.view setNeedsDisplay];
}

-(void)headPanAction:(UIPanGestureRecognizer*)gesture {
    CGPoint p = [gesture locationInView:self.view];
    
    if (!self.atta) {
        self.atta = [[UIAttachmentBehavior alloc] initWithItem:gesture.view attachedToAnchor:p];
    }
    self.atta.anchorPoint = p;
    [self.animator addBehavior:self.atta];
    [self.view setNeedsDisplay];
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.animator removeBehavior:self.atta];
    }
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
