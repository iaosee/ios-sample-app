//
//  MineViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/8/2.
//

#import "MineViewController.h"
#import "ViewController.h"
#import "SliderViewController.h"
#import "DetailViewController.h"
#import "Downloader.h"
#import "Notification.h"
#import "CommentManager.h"

#import "ImageZoomController.h"
#import "TableView01Controller.h"
#import "TableView02Controller.h"
#import "TableView03Controller.h"
#import "Drawing01Controller.h"
#import "Drawing02Controller.h"
#import "Touch01ViewController.h"
#import "Touch02ViewController.h"
#import "Touch03ViewController.h"
#import "GestureViewController.h"
#import "AnimateViewController.h"
#import "DrawingboardViewController.h"
#import "DynamicViewController.h"
#import "Dynamic02ViewController.h"
#import "Dynamic03ViewController.h"
#import "AppTableViewController.h"
#import "App02TableViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (instancetype) init {
    if (self = [super init]) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
        [button setTitle:@"ViewPage" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goViewPage) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 150, 100, 30)];
        [button setTitle:@"Slider" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goSliderPage) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 100, 30)];
        [button setTitle:@"WebView" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goWebViewPage) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 250, 100, 30)];
        [button setTitle:@"OpenSafari" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(openSafari) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 300, 100, 30)];
        [button setTitle:@"OpenApp" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(openApp) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 350, 100, 30)];
        [button setTitle:@"Notification" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(notify) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 400, 100, 30)];
        [button setTitle:@"ClickComment" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(showCommentView) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 450, 100, 30)];
        [button setTitle:@"ImageZoom" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToImageZoom) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 500, 100, 30)];
        [button setTitle:@"TableView01" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToTableView01) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 550, 100, 30)];
        [button setTitle:@"TableView02" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToTableView02) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 600, 100, 30)];
        [button setTitle:@"TableView03" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToTableView03) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 650, 100, 30)];
        [button setTitle:@"StaticTable" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToStaticTableView) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 700, 100, 30)];
        [button setTitle:@"TableView04" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToTableView04) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 100, 100, 30)];
        [button setTitle:@"AutoLayout" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goAutoLayout) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 150, 100, 30)];
        [button setTitle:@"Picker" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goPicker) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 200, 100, 30)];
        [button setTitle:@"SetBadge" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(setBadge) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 250, 100, 30)];
        [button setTitle:@"OpenModal" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(openModal) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 300, 100, 30)];
        [button setTitle:@"Drawing 01" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(drawing01) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 350, 100, 30)];
        [button setTitle:@"ChartView" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goChartView) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 400, 100, 30)];
        [button setTitle:@"Touch01" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goTouchView) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 450, 100, 30)];
        [button setTitle:@"Touch02" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goTouchView02) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 500, 100, 30)];
        [button setTitle:@"Touch03" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goTouchView03) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 550, 100, 30)];
        [button setTitle:@"Gesture" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(gestureView) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 600, 100, 30)];
        [button setTitle:@"Animate" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(redView) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 650, 100, 30)];
        [button setTitle:@"Drawingboard" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(drawingboardView) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 650, 100, 30)];
        [button setTitle:@"Dynamic01" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(dynamic01View) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 700, 100, 30)];
        [button setTitle:@"Dynamic02" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(dynamic02View) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(240, 100, 100, 30)];
        [button setTitle:@"Dynamic03" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(dynamic03View) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(240, 150, 100, 30)];
        [button setTitle:@"AppTable" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(appTable) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(240, 200, 100, 30)];
        [button setTitle:@"App02Table" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(app02Table) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(240, 250, 100, 30)];
        [button setTitle:@"download" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(downloadFile) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
}

- (void) goViewPage {
    ViewController *viewController = [[ViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) goSliderPage {
    SliderViewController *viewController = [[SliderViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) goWebViewPage {
    DetailViewController *viewController = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) openSafari {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.bing.com"]
                                       options:nil
                             completionHandler:nil];
}

- (void) openApp {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"testScheme://"] options:nil completionHandler:^(BOOL success) {
        NSLog(@"completionHandler - %@", success ? @"成功" : @"失败");
    }];
}

- (void) notify {
    [[Notification notificationManager] _localNotification];
}

- (void) showCommentView{
    [[CommentManager sharedManager] showCommentView];
}

-(void) goToImageZoom {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"ImageZoomController"];
    
    //    ImageZoomController *viewController = [[ImageZoomController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) goToTableView01 {
    UIViewController *viewController = [[TableView01Controller alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) goToTableView02 {
    UIViewController *viewController = [[TableView02Controller alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) goToTableView03 {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"TableView03Controller"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) goToStaticTableView {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Table" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"StaticTableController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) goToTableView04 {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Table" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"TableView04Controller"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) goAutoLayout {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"AutoLayout" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"AutoLayoutController"];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) goPicker {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Picker" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"PickerViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}
// deprecated
- (void) setBadge {
    UIApplication *app = [UIApplication sharedApplication];
    UIUserNotificationCategory *category = [[UIUserNotificationCategory alloc] init];
    NSSet *set = [NSSet setWithObject:category];
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:set];
    [app registerUserNotificationSettings:settings];
    app.applicationIconBadgeNumber = 10;
    app.networkActivityIndicatorVisible = YES;
    app.statusBarHidden = !app.statusBarHidden;
}

- (void) openModal {
    UIViewController *viewController = [[TableView01Controller alloc] init];
    //    viewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Picker" bundle:nil];
    //    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"PickerViewController"];
    
    //    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Table" bundle:nil];
    //    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"TableView04Controller"];
    
    [self presentViewController:viewController animated:YES completion:^{
        NSLog(@"completion");
    }];
}

- (void) drawing01 {
    UIViewController *viewController = [[Drawing01Controller alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) goChartView {
    UIViewController *viewController = [[Drawing02Controller alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) goTouchView {
    UIViewController *viewController = [[Touch01ViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) goTouchView02 {
    UIViewController *viewController = [[Touch02ViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) goTouchView03 {
    UIViewController *viewController = [[Touch03ViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) gestureView {
    UIViewController *viewController = [[GestureViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) animateView {
    UIViewController *viewController = [[AnimateViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) drawingboardView {
    //    UIViewController *viewController = [[DrawingboardViewController alloc] init];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Drawingboard" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"DrawingboardViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) dynamic01View {
    UIViewController *viewController = [[DynamicViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) dynamic02View {
    UIViewController *viewController = [[Dynamic02ViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) dynamic03View {
    UIViewController *viewController = [[Dynamic03ViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) appTable {
    UIViewController *viewController = [[AppTableViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) app02Table {
    UIViewController *viewController = [[App02TableViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test6];
//    [self downloadFile];
}

- (void) downloadFile {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please enter url" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *userNameTextField = alertController.textFields.firstObject;
        NSLog(@"Url = %@",userNameTextField.text);

//        NSString *netFile = @"https://nginx.org/download/nginx-1.22.0.tar.gz";
        NSString *netFile = userNameTextField.text;
        Downloader *downloader = [[Downloader alloc] init];
        [downloader download:netFile];
    }]];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"URL";
        textField.keyboardType = UIKeyboardTypeURL;
    }];
    [self presentViewController:alertController animated:true completion:nil];
}

- (void) test {
    NSLog(@"test task ..., %@", [NSThread currentThread]);
}
- (void) test1 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_t group = dispatch_group_create();
    for (int i = 0; i < 5; i++) {
        dispatch_group_async(group, queue, ^{
            NSLog(@"Download-%d , %@", i, [NSThread currentThread]);
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"Download finish,  %@", [NSThread currentThread]);
        // Updating UI
    });
}
/** 在当前线程执行，不开启新线程 */
- (void) test2 {
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(test) object:nil];
    [op start];
}
/** 将任务加入队列，会开启新线程执行 */
- (void) test3 {
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(test) object:nil];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:op];
}
/** 在当前线程执行，不开启新线程 */
- (void) test4 {
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        [self test];
    }];
    [op start];
}
/** 将任务加入队列，会开启新线程执行 */
- (void) test5 {
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        [self test];
    }];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:op];
}
- (void) test6 {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        [self test];
    }];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSLog(@"mainQueue end, %@", [NSThread currentThread]);
    }];
}
- (void) test7 {
    
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
