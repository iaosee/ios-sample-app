//
//  PickerItemView.m
//  SampleApp
//
//  Created by iaosee on 2022/8/29.
//

#import "PickerItemView.h"
#import "DataModel.h"

@interface PickerItemView ()

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;

@end

@implementation PickerItemView

- (void)setData:(DataModel *)data {
    _data = data;
    
    self.labelName.text = data.name;
    self.imageIcon.image = [UIImage imageNamed:data.icon];
}

+ (CGFloat) rowHeight {
    return 80;
}
+ (instancetype) pickerItem {
    PickerItemView *item = item = [[[NSBundle mainBundle] loadNibNamed:@"PickerItem" owner:nil options:nil] lastObject];
    return item;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
