//
//  Drawing02Controller.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/31.
//

#import "Drawing02Controller.h"
#import "ChartView.h"
#import "CircleProgressView.h"

@interface Drawing02Controller ()

@property(nonatomic, strong) UISlider *sliderView;
@property(nonatomic, weak) CircleProgressView *circleProgressView;

@end

@implementation Drawing02Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    ChartView * pieView = [[ChartView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    pieView.backgroundColor = [UIColor systemBlueColor];
    [self.view addSubview:pieView];
    
    CircleProgressView *circleProgressView = [[CircleProgressView alloc] initWithFrame:CGRectMake(0, 320, self.view.frame.size.width, 200)];
    circleProgressView.value = 0.2;
    circleProgressView.backgroundColor = [UIColor systemGreenColor];
    [self.view addSubview:circleProgressView];
    self.circleProgressView = circleProgressView;
    
    
    self.sliderView = [[UISlider alloc] initWithFrame:CGRectMake(0, 500, self.view.frame.size.width, 50)];
    self.sliderView.minimumValue = 0;
    self.sliderView.maximumValue = 1;
    self.sliderView.value = 0.5;
    [self.sliderView addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:self.sliderView];
}

- (void) valueChange: (CGFloat) value {
    float v = self.sliderView.value;
    self.circleProgressView.value = v;
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
