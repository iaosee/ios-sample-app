//
//  ItemViewCell.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/22.
//

#import "ItemCellView.h"
#import "DataModel.h"

@implementation ItemCellView

+ (instancetype) dataCellWithTableView:(UITableView *) tableView {
    static NSString *identifierID = @"table-cell";
    ItemCellView *cell = [tableView dequeueReusableCellWithIdentifier:identifierID];
    if (cell == nil) {
        cell = [[ItemCellView alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifierID];
    }
    return cell;
}

- (void) setData:(DataModel *) data {
    _data = data;
    self.imageView.image = [UIImage imageNamed:data.icon];
    self.textLabel.text = data.name;
    self.detailTextLabel.text = [NSString stringWithFormat:@"detail: %@ %@", data.name, data.title];
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
