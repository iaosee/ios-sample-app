//
//  DataItemCell.m
//  SampleApp
//
//  Created by iaosee on 2022/8/20.
//

#import "DataItemCell.h"
#import "DataModel.h"


@interface DataItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelCount;

@end

@implementation DataItemCell

+ (instancetype) dataCellWithTableView:(UITableView *) tableView {
    NSString *identifierID = @"data_cell";
    DataItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DataItemCell" owner:nil options:nil] lastObject];
    }
    return cell;
}


- (void) setData:(DataModel *) data {
    _data = data;
    self.imgIcon.image = [UIImage imageNamed:data.icon];
    self.labelTitle.text = data.title;
    self.labelPrice.text = [NSString stringWithFormat:@"🍎 购买人数： %@", data.price];
    self.labelCount.text = [NSString stringWithFormat:@"数量：%@", data.count];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
