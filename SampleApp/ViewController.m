//
//  ViewController.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/1.
//

#import "ViewController.h"
#import "NewsController.h""


@interface TestView : UIView

@end

@implementation TestView

- (instancetype) init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void) willMoveToSuperview:(nullable UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
}
- (void) didMoveToSuperview {
    [super didMoveToSuperview];
}
- (void) willMoveToWindow:(nullable UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
}
- (void) didMoveToWindow {
    [super didMoveToWindow];
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Hello World";
        [label sizeToFit];
        label.center = CGPointMake(
                                   self.view.frame.size.width / 2,
                                   self.view.frame.size.height / 2);
        label;
    })];

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    view2.frame = CGRectMake(150, 150, 100, 100);
    [self.view addSubview:view2];
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor blueColor];
    view3.frame = CGRectMake(200, 200, 100, 100);
    [self.view addSubview:view3];
    
    //    UIView *myView = [[TestView alloc] init];
    //    myView.backgroundColor = [UIColor greenColor];
    //    myView.frame = CGRectMake(250, 250, 100, 100);
    //    [self.view addSubview:myView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [view2 addGestureRecognizer:tapGesture];
    
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushNewsController)];
    [view3 addGestureRecognizer:tapGesture2];

    
}

- (void) pushController {
    NSLog(@"------- pushController");
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"标题";
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边标题" style:UIBarButtonItemStylePlain target:self action:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) pushNewsController {
    NSLog(@"------- pushNewsController");
    NewsController *viewController = [[NewsController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"标题-News";
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边标题" style:UIBarButtonItemStylePlain target:self action:nil];

    [self.navigationController pushViewController:viewController animated:YES];
}


@end
