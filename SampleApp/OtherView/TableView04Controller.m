//
//  TableView04Controller.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/22.
//

#import "TableView04Controller.h"
#import "DataModel.h"
#import "ItemCellView.h"
#import "GroupHeaderView.h"

#define GroupCount 4

@interface TableView04Controller ()

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
                [arrGroups addObject:[NSMutableArray array]];
            }
            NSMutableArray *groupItem = [arrGroups objectAtIndex:groupIndex];
            NSDictionary *dict = [arrDict objectAtIndex:i];
            DataModel *data = [[DataModel alloc] initWithDict:dict];
            [groupItem addObject:data];
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
    NSArray *groupItem = self.groups[section];
    return groupItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *groupItem = self.groups[indexPath.section];
    DataModel *item = [groupItem objectAtIndex:indexPath.row % GroupCount];
    ItemCellView *cell = [ItemCellView dataCellWithTableView:tableView];
    cell.data = item;
    return cell;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [NSString stringWithFormat:@"Group %ld", section];
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    GroupHeaderView *goupHeadear = [GroupHeaderView gourpHeaderWithTableView:tableView];
    NSArray *groupItem = self.groups[section];
    goupHeadear.gorup = groupItem;
    goupHeadear.gorupName = [NSString stringWithFormat:@"Group %ld", section];
    return goupHeadear;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
