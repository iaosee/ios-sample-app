//
//  GroupHeaderView.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/22.
//

#import "GroupHeaderView.h"

@interface GroupHeaderView ()

@property(nonatomic, weak) UIButton *buttonTitle;
@property(nonatomic, weak) UILabel *labelName;

@end

@implementation GroupHeaderView

+ (instancetype) gourpHeaderWithTableView: (UITableView *) tableView {
    static NSString *identifierID = @"table-group-header";
    GroupHeaderView *goupHeadear = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifierID];
    if (goupHeadear == nil) {
        goupHeadear = [[GroupHeaderView alloc] initWithReuseIdentifier:identifierID];
    }
    goupHeadear.contentView.backgroundColor = [UIColor grayColor];
    return goupHeadear;
}

- (void)setGorupName:(NSString *)gorupName {
    [self.buttonTitle setTitle:gorupName forState:UIControlStateNormal];
    self.labelName.text = [NSString stringWithFormat:@"%ld", self.gorup.count];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *buttonTitle = [UIButton buttonWithType:UIButtonTypeSystem];
        UILabel *labelName = [[UILabel alloc] init];
        
        buttonTitle.backgroundColor = [UIColor lightGrayColor];
        buttonTitle.titleLabel.font = [UIFont systemFontOfSize:12];
        labelName.font = [UIFont systemFontOfSize:12];
        
        [buttonTitle setImage:[UIImage systemImageNamed:@"arrowtriangle.forward.fill"] forState:UIControlStateNormal];
        [buttonTitle setImage:[UIImage systemImageNamed:@"arrowtriangle.down.fill"] forState:UIControlStateHighlighted];
        buttonTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        buttonTitle.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        buttonTitle.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
        
        [buttonTitle addTarget:self action:@selector(buttonTitleClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:buttonTitle];
        [self.contentView addSubview:labelName];
        self.buttonTitle = buttonTitle;
        self.labelName = labelName;
    }
    return self;
}

- (void) buttonTitleClick {
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.buttonTitle.frame = self.bounds;
    CGFloat labelW = 100;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - 10 - labelW;
    CGFloat labelY = 0;
    self.labelName.frame = CGRectMake(labelX, labelY, labelW, labelH);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
