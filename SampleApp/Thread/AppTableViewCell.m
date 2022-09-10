//
//  AppTableViewCell.m
//  SampleApp
//
//  Created by xiaofeng on 2022/9/10.
//

#import "AppTableViewCell.h"

@implementation AppTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    NSLog(@"AppTableViewCell layoutSubviews");
}
@end
