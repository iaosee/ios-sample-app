//
//  MineViewController.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/2.
//

#import "MineViewController.h"
#import "ViewController.h"
#import "SliderViewController.h"
#import "DetailViewController.h"

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
