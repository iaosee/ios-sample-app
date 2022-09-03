//
//  Touch02ViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/9/2.
//

#import "Touch02ViewController.h"

@interface Touch02ViewController ()

@end

@implementation Touch02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    // support multiple touch
    self.view.multipleTouchEnabled = YES;
    self.view.userInteractionEnabled = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self addView:touches];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self addView:touches];
}

- (void) addView: (NSSet<UITouch *> *) touches {
    for (UITouch *t in touches) {
//        UITouch *t = [touches anyObject];
        CGPoint pos = [t locationInView:t.view];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(pos.x, pos.y, 10, 10)];
        UIColor *randColor = [UIColor colorWithRed:arc4random_uniform(256) / 255. green:arc4random_uniform(256) / 255. blue:arc4random_uniform(256) / 255. alpha:1.0];
        view.backgroundColor = randColor;
        
        [self.view addSubview:view];
        [UIView animateWithDuration:.8 animations:^{
            view.alpha = 0;
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
    }
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
