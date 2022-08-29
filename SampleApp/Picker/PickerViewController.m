//
//  PickerViewController.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/29.
//

#import "PickerViewController.h"
#import "DataModel.h"
#import "PickerItemView.h"

@interface PickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSArray<DataModel *> *list;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIToolbar *toolBar;

@end

@implementation PickerViewController

- (NSArray<DataModel *> *)list {
    if (_list == nil) {
        NSArray *arrDict = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mockdata.plist" ofType:nil]];
        NSMutableArray *arrModels = [NSMutableArray array];
        for (NSDictionary *dict in arrDict) {
            DataModel *data = [[DataModel alloc] initWithDict:dict];
            [arrModels addObject:data];
        }
        _list = arrModels;
    }
    return _list;
}

- (UIDatePicker *)datePicker {
    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.datePickerMode = UIDatePickerModeDate; // UIDatePickerModeDateAndTime
        _datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels; // UIDatePickerStyleInline;
        _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
    }
    return _datePicker;
}

- (UIToolbar *)toolBar {
    if (_toolBar == nil) {
        _toolBar = [[UIToolbar alloc] init];
        _toolBar.bounds = CGRectMake(0, 0, 0, 44);
        
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelHandler)];
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneHandler)];
        
        _toolBar.items = @[cancelButton, flexSpace, doneButton];
    }
    return _toolBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"%@", self.list);
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    self.dateTextField.inputView = self.datePicker;
    self.dateTextField.inputAccessoryView = self.toolBar;
}

- (void) cancelHandler {
    [self.view endEditing:YES];
}
- (void) doneHandler {
    NSDate *date = self.datePicker.date;
    //    NSString *strDate = [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年MM月dd日 HH:mm:ss";
    NSString *strDate = [formatter stringFromDate:date];

    self.dateTextField.text = strDate;
    [self.view endEditing:YES];
}

#pragma mark - UIPickerViewDataSource, UIPickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.list.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.list[row].name;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {

    PickerItemView *itemView = [PickerItemView pickerItem];
    itemView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 80);
    itemView.data = self.list[row];
    return itemView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return [PickerItemView rowHeight];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
