//
//  Touch03ViewController.m
//  SampleApp
//
//  Created by xiaofeng on 2022/9/3.
//

#import "Touch03ViewController.h"
#import "GestureLockView.h"

@interface Touch03ViewController () <GestureLockViewDelegate>

@property(nonatomic, weak) GestureLockView *lockView;
@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation Touch03ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
    
    self.lockView.delegate = self;
    
// Block way
//    self.lockView.verifyPasswordBlock = ^BOOL(NSString * _Nonnull password) {
//        NSLog(@"verifyPasswordBlock - %@", password);
//        return [password isEqual:@"0124678"];
//    };
}

// Delegate way
- (BOOL) verifyPassword:(NSString *)password {
    NSLog(@"verifyPassword - %@", password);
    return [password isEqual:@"0124678"];
}
- (void) verifyFinish {
    NSLog(@"verifyFinish");
//    self.imageView.image = [self nomalSnapshotImage];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touch03ViewController touchesBegan");
}
- (UIImage *)nomalSnapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.lockView.frame.size, NO, 0);
    [self.lockView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshotImage;
}

- (void) initView {
    UIImage *image = [UIImage imageNamed:@"mars-bg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    GestureLockView *lockView = [[GestureLockView alloc] init];
//    containerView.frame = CGRectMake(0, 0, 300, 300);
    lockView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<NSLayoutConstraint *> *constraints = @[
        [NSLayoutConstraint constraintWithItem:lockView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1
                                      constant:320],
        [NSLayoutConstraint constraintWithItem:lockView
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1
                                      constant:320],
        [NSLayoutConstraint constraintWithItem:lockView
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem:lockView
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1
                                      constant:0]
    ];
    
    self.lockView = lockView;
    [self.view addSubview:self.lockView];
    [self.view addConstraints:constraints];

    //    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - 100) / 2, 80, 100, 100)];
//    imageView.translatesAutoresizingMaskIntoConstraints = NO;
//    imageView.backgroundColor = [UIColor grayColor];
//    self.imageView = imageView;
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [self.view addSubview:imageView];
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
