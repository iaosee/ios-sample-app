//
//  PickerItemView.h
//  SampleApp
//
//  Created by 肖峰 on 2022/8/29.
//

#import <UIKit/UIKit.h>
@class  DataModel;

NS_ASSUME_NONNULL_BEGIN

@interface PickerItemView : UIView

@property(nonatomic, strong) DataModel *data;

+ (CGFloat) rowHeight;
+ (instancetype) pickerItem;

@end

NS_ASSUME_NONNULL_END
