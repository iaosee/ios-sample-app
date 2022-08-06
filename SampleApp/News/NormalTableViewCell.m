//
//  NormalTableViewCell.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/2.
//

#import "NormalTableViewCell.h"
#import "ListItem.h"

@interface NormalTableViewCell()

@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *contentLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;

@property(nonatomic, strong, readwrite) UIImageView *rightImageView;

@end

@implementation NormalTableViewCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}



- (instancetype) initWithStyle: (UITableViewCellStyle) style reuseIdentifier:(nullable NSString *) reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 260, 50)];
//            self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel.font = [UIFont systemFontOfSize: 16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 1;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 260, 30)];
//            self.contentLabel.backgroundColor = [UIColor grayColor];
            self.contentLabel.font = [UIFont systemFontOfSize: 12];
            self.contentLabel.numberOfLines = 0;
            self.contentLabel.textColor = [UIColor lightGrayColor];
            self.contentLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
//            self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel.font = [UIFont systemFontOfSize: 12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 80, 50, 20)];
//            self.commentLabel.backgroundColor = [UIColor greenColor];
            self.commentLabel.font = [UIFont systemFontOfSize: 12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 80, 50, 20)];
//            self.timeLabel.backgroundColor = [UIColor blueColor];
            self.timeLabel.font = [UIFont systemFontOfSize: 12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 80, 40, 20)];
//            self.deleteButton.contentMode = UIViewContentModeScaleAspectFit;
//            self.deleteButton.titleLabel.font = [UIFont systemFontOfSize: 12];
//            self.deleteButton.titleLabel.textColor = [UIColor grayColor];
//            [self.deleteButton setTitle:@"删除" forState:UIControlStateNormal];
//            [self.deleteButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//            self.deleteButton.layer.cornerRadius = 10;
//            self.deleteButton.layer.masksToBounds = YES;
//            self.deleteButton.layer.borderColor = [UIColor redColor].CGColor;
//            self.deleteButton.layer.borderWidth = 1;
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//            self.deleteButton;
//        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 10, 80, 80)];
            self.rightImageView.backgroundColor = [UIColor lightGrayColor];
            self.rightImageView.contentMode = UIViewContentModeScaleToFill;
            self.rightImageView;
        })];
    }
    
    return self;
}

- (void) layoutTableViewCell {
    self.titleLabel.text = @"新闻标题";
    self.contentLabel.text = @"第5部分 Objective-C高级主题 第33章 init 33.1 编写init方法 33.2 实现基本的init方法 33.3 instancetype类型 33.4 使用并检查父类的初始化方法 33.5 带实参的init方法 33.6 在init中使用存取方法 33.7 多个初始化方法 33.8 禁用init方法";
    
    self.sourceLabel.text = @"来源";
    self.commentLabel.text = @"1688条评论";
    self.timeLabel.text = @"三分钟前";
    self.rightImageView.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
    
    [self cellLayout];
    
}

- (void) layoutTableViewCellWithItem: (ListItem *) item {
    self.titleLabel.text = item.title;
    self.contentLabel.text = [NSString stringWithFormat:@"%@ %@", item.title, item.title];
    
    self.sourceLabel.text = item.authorName;
    self.commentLabel.text = item.category;
    self.timeLabel.text = item.date;
    
#warning
    UIImage *image = [NSData dataWithContentsOfURL: [NSURL URLWithString:item.picUrl]];
    self.rightImageView.image = image;
    
    [self cellLayout];
}

- (void) cellLayout {
    [self.sourceLabel sizeToFit];
    [self.commentLabel sizeToFit];
    [self.timeLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(
                                 self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 10,
                                 self.commentLabel.frame.origin.y ,
                                 self.commentLabel.frame.size.width,
                                 self.commentLabel.frame.size.height);
    self.timeLabel.frame = CGRectMake(
                                 self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 10,
                                 self.timeLabel.frame.origin.y ,
                                 self.timeLabel.frame.size.width,
                                 self.timeLabel.frame.size.height);
    self.deleteButton.frame = CGRectMake(
                                 self.timeLabel.frame.origin.x + self.timeLabel.frame.size.width + 10,
                                 self.deleteButton.frame.origin.y ,
                                 self.deleteButton.frame.size.width,
                                 self.deleteButton.frame.size.height);
}

- (void) deleteButtonClick {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}

@end
