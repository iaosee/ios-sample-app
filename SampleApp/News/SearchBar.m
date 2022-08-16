//
//  SearchBar.m
//  SampleApp
//
//  Created by iaosee on 2022/8/10.
//

#import "SearchBar.h"

@interface SearchBar ()<UITextFieldDelegate>

@property(nonatomic, strong, readwrite) UITextField *textField;

@end

@implementation SearchBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 7, frame.size.width - 10 *2, frame.size.height - 7 * 2)];
            _textField.backgroundColor = [UIColor whiteColor];
            _textField.delegate = self;
            _textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
            _textField.leftViewMode = UITextFieldViewModeUnlessEditing;
            _textField.clearButtonMode = UITextFieldViewModeAlways;
            _textField.placeholder = @"今日热点推荐";
            _textField;
        })];
    }
    return self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    //
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //常用业务逻辑 - 字数判断 可以在此函数中实现
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textField resignFirstResponder];
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
