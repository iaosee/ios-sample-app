//
//  DataItemCell.h
//  SampleApp
//
//  Created by iaosee on 2022/8/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DataModel;

@interface DataItemCell : UITableViewCell

@property(nonatomic, strong) DataModel *data;

+ (instancetype) dataCellWithTableView:(UITableView *) tableView;

@end

NS_ASSUME_NONNULL_END
