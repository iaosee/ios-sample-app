//
//  MessageCell.h
//  SampleApp
//
//  Created by iaosee on 2022/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SAMessageFrame;

@interface MessageCell : UITableViewCell

@property(nonatomic, weak) SAMessageFrame *messageFrame;

+ (instancetype) messageCellWithTableView:(UITableView *) tableView;

@end

NS_ASSUME_NONNULL_END
