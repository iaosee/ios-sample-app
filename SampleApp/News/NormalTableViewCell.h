//
//  NormalTableViewCell.h
//  SampleApp
//
//  Created by 肖峰 on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NormalTableViewCellDelegate <NSObject>

- (void) tableViewCell:(UITableViewCell *) tableViewCell clickDeleteButton:(UIButton *) deleteButton;

@end

@interface NormalTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<NormalTableViewCellDelegate> delegate;

- (void) layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END
