//
//  Touch01ViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/9/2.
//

#import "Touch01ViewController.h"
#import "DragView.h"

@interface Touch01ViewController ()

@property(nonatomic, weak) DragView *dragView;

@end

@implementation Touch01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    DragView *dragView = [[DragView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.dragView = dragView;
    
    [self.view addSubview:dragView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touch01ViewController touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touch01ViewController touchesMoved");
    
    UITouch *t = [touches anyObject];
    CGPoint currentPos = [t locationInView:self.view];
    CGPoint previousPos = [t previousLocationInView:self.view];
    CGFloat offsetX = currentPos.x - previousPos.x;
    CGFloat offsetY = currentPos.y - previousPos.y;

    self.dragView.center = CGPointMake(self.dragView.center.x + offsetX, self.dragView.center.y + offsetY);
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
