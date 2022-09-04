//
//  GestureViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/9/3.
//

#import "GestureViewController.h"

@interface GestureViewController () <UIGestureRecognizerDelegate>

@property(nonatomic, weak) UIImageView *gestureView;

@end

@implementation GestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIImage *image = [UIImage imageNamed:@"mars-bg"];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.view.backgroundColor = [UIColor whiteColor];
/**
 UIGestureRecognizer *gesture;
 UITapGestureRecognizer *tapGesture;
 UIHoverGestureRecognizer *hoverGesture;
 UISwipeGestureRecognizer *swipeGesture;
 UILongPressGestureRecognizer *longPressGesture;
 UIPinchGestureRecognizer *pinch;
 UIRotationGestureRecognizer *rotate;
 UIScreenEdgePanGestureRecognizer *screenEdgePan;
 */
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 360, 250)];
//    view.backgroundColor = [UIColor blueColor];
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, 360, 250)];
    view.image = [UIImage imageNamed:@"mars"];
    view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandler:)];
    UILongPressGestureRecognizer *gesture1 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandler:)];
    UISwipeGestureRecognizer *gesture2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandler:)];
    UIRotationGestureRecognizer *gesture3 = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(roateHandler:)];
    UIPinchGestureRecognizer *gesture4 = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchHandler:)];
    UIPanGestureRecognizer *gesture5 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
    
    gesture3.delegate = self;
    gesture4.delegate = self;
    gesture2.direction = UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft;
//    gesture2.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
    [view addGestureRecognizer:gesture];
    [view addGestureRecognizer:gesture1];
    [view addGestureRecognizer:gesture2];
    [view addGestureRecognizer:gesture3];
    [view addGestureRecognizer:gesture4];
    [view addGestureRecognizer:gesture5];
    
    [self.view addSubview:view];
    self.gestureView = view;
}

- (void) gestureHandler:(UIGestureRecognizer *) gesture {
    NSLog(@"gestureHandler - %@", [gesture class]);
}
- (void) roateHandler: (UIRotationGestureRecognizer *) gesture {
    NSLog(@"roateHandler - %@", [gesture class]);
    NSLog(@"gesture.rotation - %f", gesture.rotation);
    
    self.gestureView.transform = CGAffineTransformRotate(self.gestureView.transform, gesture.rotation);
    gesture.rotation = 0;
}
- (void) pinchHandler:(UIPinchGestureRecognizer *) gesture {
    NSLog(@"pinchHandler - %@", [gesture class]);
    NSLog(@"gesture.scale - %f", gesture.scale);
    
    self.gestureView.transform = CGAffineTransformScale(self.gestureView.transform, gesture.scale, gesture.scale);
    gesture.scale = 1;
}
- (void) panHandler:(UIPanGestureRecognizer *) gesture {
    CGPoint p = [gesture translationInView:gesture.view];
    self.gestureView.transform = CGAffineTransformTranslate(self.gestureView.transform, p.x, p.y);
    
    [gesture setTranslation:CGPointZero inView:gesture.view];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
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
