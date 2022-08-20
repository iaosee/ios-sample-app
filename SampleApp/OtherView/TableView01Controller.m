//
//  TableView01Controller.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/20.
//

#import "TableView01Controller.h"

@interface TableView01Controller () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, weak) NSArray *apps;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation TableView01Controller

- (NSArray *) apps {
    if(_apps == nil) {
        _apps = [NSArray arrayWithObjects:
                         @"apple-fitness", @"apple-logo", @"apple-music-lyrics", @"apple-tv",
                     @"find-iphone", @"ibooks", @"icloud", @"imovie",
                     @"ios-photos", @"mail", @"maps", @"music",
                     @"shortcuts", @"swiftui", @"touch-id", @"translate-app", nil];
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 80;
    
    [self.view addSubview:self.tableView];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - UITableViewDataSource

// How many row in each group
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}

// How many groups
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"GroupHeader %ld", (long)section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"GroupFooter %ld", (long)section];
}

#pragma mark - UITableViewDelegate

// return pre cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name = self.apps[indexPath.row % self.apps.count];

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.imageView.image = [UIImage imageNamed:name];
    cell.textLabel.text = name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@,%@,%@", name, name, name];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    if (indexPath.row % 2) {
        cell.backgroundColor = [UIColor lightTextColor];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    UISwitch *switcher = [[UISwitch alloc] init];
//    cell.accessoryView = switcher;
    
    
    return cell;
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
