//
//  TableFooterView.h
//  SampleApp
//
//  Created by iaosee on 2022/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TableFooterView;

@protocol TableFooterViewDelegate <NSObject>

@required
- (void) tableFooterViewUpdate:(TableFooterView *) footerView;

@end

@interface TableFooterView : UIView

@property(nonatomic, weak) id<TableFooterViewDelegate> delegate;

+ (instancetype) footerView;

@end

NS_ASSUME_NONNULL_END
