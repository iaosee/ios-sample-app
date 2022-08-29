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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"%@", self.list);
    self.picker.dataSource = self;
    self.picker.delegate = self;
}


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
