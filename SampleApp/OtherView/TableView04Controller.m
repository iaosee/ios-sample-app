//
//  TableView04Controller.m
//  SampleApp
//
//  Created by iaosee on 2022/8/22.
//

#import "TableView04Controller.h"
#import "DataModel.h"
#import "ItemCellView.h"
#import "GroupHeaderView.h"

#define GroupCount 4

// TODO: Not effective
@interface TableView04Controller () <GroupHeaderViewDelegate>

@end

@implementation TableView04Controller

- (NSArray *) groups {
    if ( _groups == nil ) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"mockdata.plist" ofType:nil];
        NSArray *arrDict = [NSArray arrayWithContentsOfFile:path];
        const NSInteger count = arrDict.count;
        NSMutableArray *arrGroups = [NSMutableArray array];
        for (int i = 0; i < count; i++) {
            const int groupIndex = i / GroupCount;
            if (i % GroupCount == 0) {
                NSMutableDictionary *group = [[NSMutableDictionary alloc] initWithDictionary:@{
                    @"name": [NSString stringWithFormat:@"Group %d", groupIndex],
                    @"visible": @(NO),
                    @"list": [NSMutableArray array]
                }];
                [arrGroups addObject:group];
            }
            NSMutableDictionary *groupItem = [arrGroups objectAtIndex:groupIndex];
            NSMutableDictionary *dict = [arrDict objectAtIndex:i];
            DataModel *data = [[DataModel alloc] initWithDict:dict];
            [[groupItem objectForKey:@"list"] addObject:data];
        }
        _groups = arrGroups;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.sectionHeaderHeight = 40;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *groupItem = self.groups[section];
    BOOL visible = [groupItem objectForKey:@"visible"];
    NSArray *list = [groupItem objectForKey:@"list"];
//    [tableView indexPathsForVisibleRows];
    if (!visible) {
        return 0;
    }
    return list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *groupItem = self.groups[indexPath.section];
    NSArray *list = [groupItem objectForKey:@"list"];
    
    DataModel *item = [list objectAtIndex:indexPath.row % GroupCount];
    ItemCellView *cell = [ItemCellView dataCellWithTableView:tableView];
    cell.tag = 0;
    cell.data = item;
    return cell;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [NSString stringWithFormat:@"Group %ld", section];
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSMutableDictionary *groupItem = self.groups[section];

    GroupHeaderView *goupHeadear = [GroupHeaderView gourpHeaderWithTableView:tableView];
    goupHeadear.group = groupItem;
    goupHeadear.groupIndex = section;
    goupHeadear.delegate = self;
    goupHeadear.tag = section;

    return goupHeadear;
}

#pragma mark - GroupHeaderViewDelegate

- (void)groupHeaderViewButtonClick:(GroupHeaderView *)headerView section:(NSInteger) index{
    NSMutableDictionary *groupItem = self.groups[index];
    BOOL visible = [groupItem objectForKey:@"visible"];
    [groupItem setValue:@(NO) forKey:@"visible"];
    NSLog(@"%@", groupItem);    
//    [self.tableView reloadData];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headerView.tag];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

@end
