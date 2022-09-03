//
//  DialogCellView.m
//  SampleApp
//
//  Created by iaosee on 2022/8/4.
//

#import "DialogCellView.h"

@interface DialogCellView()

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, strong, readwrite) dispatch_block_t deleteBlock;

@end

const float w = 200;
const float h = 200;

@implementation DialogCellView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.2;
            
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDialogView)];
                tapGesture;
            })];
            _backgroundView;
        })];
        [self addSubview:({
            _deleteButton = [[UIButton alloc]
                             initWithFrame:CGRectMake(
                                                      0,
                                                      0,
                                                      0,
                                                      0)];
            _deleteButton.backgroundColor = [UIColor blueColor];
            [_deleteButton addTarget:self action:@selector(_clickButtonHandler) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton;
        })];
    }
    
    return self;
}

-(void) showDialogViewFromPoint: (CGPoint) point clickBlock: (dispatch_block_t)clickBlock {
    
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = [clickBlock copy];
    
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    UIWindow *keyWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
//    UIWindow *keyWindow = self.window.windowScene.keyWindow;
    UIWindow *keyWindow = UIApplication.sharedApplication.windows.lastObject;
    [keyWindow addSubview:self];
    
//    [UIView animateWithDuration:1.f animations:^{
//       self.deleteButton.frame = CGRectMake(
//                                            self.bounds.size.width / 2 - w / 2,
//                                            self.bounds.size.height / 2 - h / 2,
//                                            w,
//                                            h);
//    }];
    
    [UIView animateWithDuration:1.f
                          delay:0.f
         usingSpringWithDamping:0.5
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
        self.deleteButton.frame = CGRectMake(
                                            self.bounds.size.width / 2 - w / 2,
                                            self.bounds.size.height / 2 - h / 2,
                                            w,
                                            h);
    }
                     completion:^(BOOL finished){
            
    }];
}

-(void) dismissDialogView {
    [self removeFromSuperview];
}
- (void) _clickButtonHandler {
    
    if(_deleteBlock) {
        _deleteBlock();
    }
    
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
