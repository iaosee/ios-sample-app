//
//  TableFooterView.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/21.
//

#import "TableFooterView.h"

@interface TableFooterView ()

@property (weak, nonatomic) IBOutlet UIButton *buttonLoad;
@property (weak, nonatomic) IBOutlet UIView *viewMore;

- (IBAction)loadMoreHandler:(id)sender;

@end

@implementation TableFooterView

+ (instancetype) footerView {
    return [[[NSBundle mainBundle] loadNibNamed:@"TableFooterView" owner:nil options:nil] lastObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)loadMoreHandler:(id)sender {
    self.buttonLoad.hidden = YES;
    self.viewMore.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(tableFooterViewUpdate:)]) {
            [self.delegate tableFooterViewUpdate:self];
        }
        self.buttonLoad.hidden = NO;
        self.viewMore.hidden = YES;
    });

//    [NSTimer scheduledTimerWithTimeInterval:1.5 repeats:NO block:^(NSTimer * _Nonnull timer) {
//        if ([self.delegate respondsToSelector:@selector(tableFooterViewUpdate:)]) {
//            [self.delegate tableFooterViewUpdate:self];
//        }
//        self.buttonLoad.hidden = NO;
//        self.viewMore.hidden = YES;
//    }];
}
@end
