//
//  GroupHeaderView.h
//  SampleApp
//
//  Created by 肖峰 on 2022/8/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GroupHeaderView : UITableViewHeaderFooterView

@property(nonatomic, copy) NSString *gorupName;

+ (instancetype) gourpHeaderWithTableView: (UITableView *) tableView;

@end

NS_ASSUME_NONNULL_END
