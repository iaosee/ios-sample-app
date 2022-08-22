//
//  MessageCell.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/21.
//

#import "MessageCell.h"
#import "SAMessage.h"
#import "SAMessageFrame.h"

@interface MessageCell ()

@property (nonatomic, weak) UILabel *labelTime;
@property (nonatomic, weak) UIImageView *imageIcon;
@property (nonatomic, weak) UIButton *buttonText;

@end

@implementation MessageCell

+ (instancetype) messageCellWithTableView:(UITableView *) tableView {
    NSString *identifierID = @"data_cell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierID];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifierID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *labelTime = [[UILabel alloc] init];
        labelTime.font = [UIFont systemFontOfSize:12];
        labelTime.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:labelTime];
        
        UIImageView *imageIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:imageIcon];
        
        UIButton *buttonText = [[UIButton alloc] init];
        buttonText.titleLabel.font = textFont;
        [buttonText setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        buttonText.titleLabel.numberOfLines = 0;
//        buttonText.titleLabel.backgroundColor = [UIColor redColor];
        buttonText.backgroundColor = [UIColor blueColor];
        buttonText.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
//        UIButtonConfiguration *config = [UIButtonConfiguration plainButtonConfiguration];
//        config.contentInsets = NSDirectionalEdgeInsetsMake(10, 10, 10, 10);
//        buttonText.configuration = config;
        [self.contentView addSubview:buttonText];

        self.labelTime = labelTime;
        self.imageIcon = imageIcon;
        self.buttonText = buttonText;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setMessageFrame:(SAMessageFrame *)messageFrame {
    _messageFrame = messageFrame;
    SAMessage *message = messageFrame.message;
    
    self.labelTime.text = message.time;
    self.labelTime.frame = messageFrame.timeFrame;
    self.labelTime.hidden = message.hiddenTime;
    
    self.imageIcon.image = [UIImage imageNamed:message.icon];
    self.imageIcon.frame = messageFrame.iconFrame;
    
    [self.buttonText setTitle:message.text forState:UIControlStateNormal];
    self.buttonText.frame = messageFrame.textFrame;
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
