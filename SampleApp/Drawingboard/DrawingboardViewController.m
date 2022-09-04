//
//  DrawingboardViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/9/4.
//

#import "DrawingboardViewController.h"
#import "DrawingboardView.h"

@interface DrawingboardViewController ()

@property (weak, nonatomic) IBOutlet DrawingboardView *drawingView;

@end

@implementation DrawingboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)sliderChange:(UISlider *)sender {
    self.drawingView.lineWidth = sender.value;
}
- (IBAction)clearAction:(id)sender {
    [self.drawingView clear];
}
- (IBAction)backAction:(id)sender {
    [self.drawingView revoke];
}
- (IBAction)eraserAction:(id)sender {
    self.drawingView.lineColor = self.drawingView.backgroundColor;
}
- (IBAction)saveAction:(id)sender {
    UIGraphicsBeginImageContextWithOptions(self.drawingView.bounds.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.drawingView.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (IBAction)setColor:(UIView *)sender {
    self.drawingView.lineColor = sender.backgroundColor;
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = nil ;
    if(error){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    NSLog(@"%@", msg);
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
