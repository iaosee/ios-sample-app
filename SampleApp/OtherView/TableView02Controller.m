//
//  TableView02ViewController.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/20.
//

#import "TableView02Controller.h"
#import "DataModel.h"
#import "DataItemCell.h"
#import "TableFooterView.h"

@interface TableView02Controller () <UITableViewDataSource, UITableViewDelegate, TableFooterViewDelegate>

@property(nonatomic, strong) NSMutableArray *data;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation TableView02Controller

- (NSArray *) data {
    
    if ( _data == nil ) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"mockdata.plist" ofType:nil];
        NSArray *arrDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrModels = [NSMutableArray array];
        for (NSDictionary *dict in arrDict) {
            DataModel *data = [[DataModel alloc] initWithDict:dict];
            [arrModels addObject:data];
        }
        _data = arrModels;
    }
    
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
}

- (void) initView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 60;
    
    TableFooterView *footerView = [TableFooterView footerView];
    footerView.delegate = self;
    
    self.tableView.tableFooterView = footerView;

    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

// use xib
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DataModel *item = self.data[indexPath.row];

    DataItemCell *cell = [DataItemCell dataCellWithTableView:tableView];
    cell.data = item;

    return cell;
}

- (UITableViewCell *)tableViewBackup:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DataModel *item = self.data[indexPath.row];
    
    NSString *identifierID = @"data_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierID];
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifierID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifierID];
    }
    cell.imageView.image = [UIImage imageNamed:item.icon];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"🍎 购买人数： %@", item.price];
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - TableFooterViewDelegate
 
- (void) tableFooterViewUpdate:(TableFooterView *) footerView {
    NSArray *names = @[
        @"Manuel.Bode79", @"Grayce51", @"Rozella_Trantow", @"Estrella_Toy48",
        @"Glenna20", @"Morton47", @"Demarcus.Gleason", @"Shirley.Weimann",
        @"Diego2", @"Destiney_Goldner", @"Clemmie.Little67",
        @"Harry_Lind", @"Naomie7", @"Ellen98", @"Brendan2", @"Gracie_Funk88"
    ];
    for (int i = 0; i < 10; i++) {
        int index = (arc4random() % [names count]);
        NSString *name = names[index];
        DataModel* item = self.data[index];
        
        NSDictionary *dict = @{
            @"icon": item.icon,
            @"name": item.name,
            @"title": name,
            @"count": @((arc4random() % 1000)),
            @"price": @((arc4random() % 10000)),
        };
        
        DataModel* dataItem = [DataModel dataWithDict:dict];
        [self.data addObject:dataItem];
    }

    [self.tableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.data.count - 10 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
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
