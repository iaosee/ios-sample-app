//
//  GroupHeaderView.h
//  SampleApp
//
//  Created by iaosee on 2022/8/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GroupHeaderView;

@protocol GroupHeaderViewDelegate <NSObject>
- (void) groupHeaderViewButtonClick:(GroupHeaderView *) headerView section:(NSInteger) index;
@end

@interface GroupHeaderView : UITableViewHeaderFooterView

@property(nonatomic, weak) NSMutableDictionary *group;
@property(nonatomic, assign) NSInteger groupIndex;

@property(nonatomic, weak) id<GroupHeaderViewDelegate> delegate;
+ (instancetype) gourpHeaderWithTableView: (UITableView *) tableView;

@end

NS_ASSUME_NONNULL_END
