//
//  DialogCellView.h
//  SampleApp
//
//  Created by xiaofeng on 2022/8/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DialogCellView : UIView

-(void) showDialogViewFromPoint: (CGPoint) point clickBlock: (dispatch_block_t)clickBlock;

@end

NS_ASSUME_NONNULL_END
