//
//  MineController.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/2.
//

#import "MineController.h"
#import "SliderController.h"

@interface MineController ()

@end

@implementation MineController

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
        [button setTitle:@"Button" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        
        [button addTarget:self action:@selector(goSliderPage) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
}

- (void) goSliderPage {
    SliderController *viewController = [[SliderController alloc] init];
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
