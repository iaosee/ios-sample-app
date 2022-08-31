//
//  Drawing01Controller.m
//  SampleApp
//
//  Created by iaosee on 2022/8/31.
//

#import "Drawing01Controller.h"
#import "DrawingView.h"

@interface Drawing01Controller ()

@end

@implementation Drawing01Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView * view = [[DrawingView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 600)];
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
