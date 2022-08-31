//
//  Drawing02Controller.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/31.
//

#import "Drawing02Controller.h"
#import "ChartView.h"

@interface Drawing02Controller ()

@end

@implementation Drawing02Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView * view = [[ChartView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 600)];
    view.backgroundColor = [UIColor systemBlueColor];
    [self.view addSubview:view];
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
