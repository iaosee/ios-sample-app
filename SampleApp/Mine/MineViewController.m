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
#import "Notification.h"
#import "CommentManager.h"
#import "ImageZoomController.h"
#import "TableView01Controller.h"
#import "TableView02Controller.h"
#import "TableView03Controller.h"

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
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 150, 30)];
        [button setTitle:@"ViewPage" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goViewPage) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 150, 150, 30)];
        [button setTitle:@"SliderPage" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goSliderPage) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];

    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 150, 30)];
        [button setTitle:@"WebViewPage" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goWebViewPage) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 250, 150, 30)];
        [button setTitle:@"OpenSafari" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(openSafari) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 300, 150, 30)];
        [button setTitle:@"Open App" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(openApp) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 350, 150, 30)];
        [button setTitle:@"Push Notification" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(notify) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 400, 150, 30)];
        [button setTitle:@"Click Comment" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(showCommentView) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 450, 150, 30)];
        [button setTitle:@"Image Zoom" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToImageZoom) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 500, 150, 30)];
        [button setTitle:@"TableView 01" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToTableView01) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 550, 150, 30)];
        [button setTitle:@"TableView 02" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToTableView02) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 600, 150, 30)];
        [button setTitle:@"TableView 03" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToTableView03) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 650, 150, 30)];
        [button setTitle:@"Static TbaleView" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(goToStaticTableView) forControlEvents:UIControlEventTouchUpInside];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
