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
@property(nonatomic, weak) UIImageView *imageView;

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
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 550, 256, 256)];
    imageView.backgroundColor = [UIColor lightGrayColor];
    self.imageView = imageView;
    [self.view addSubview:imageView];

//    [self imageTapHandler];
    [self drawingCircleImage];
    
}

- (void) valueChange: (CGFloat) value {
    float v = self.sliderView.value;
    self.circleProgressView.value = v;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self imageTapHandler];
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void) imageTapHandler {
    CGSize size = self.imageView.bounds.size;
//    UIGraphicsBeginImageContext(size);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0); // [UIScreen mainScreen].scale
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 150, 50);
    CGContextStrokePath(ctx);
    CGContextAddArc(ctx, 200, 100, 50, 0, M_PI * 2, 1);
    CGContextStrokePath(ctx);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.imageView.image = image;
}

#pragma mark -- <保存到相册>
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = nil ;
    if(error){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    NSLog(@"%@", msg);
}

- (void) drawingCircleImage {
    UIImage *image = [UIImage imageNamed:@"icon.bundle/icon.png"];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddArc(
                    ctx,
                    image.size.width * 0.5,
                    image.size.width * 0.5,
                    image.size.width * 0.5,
                    0,
                    M_PI * 2,
                    1);
    CGContextClip(ctx);
    [image drawAtPoint:CGPointZero];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.imageView.image = newImage;
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
