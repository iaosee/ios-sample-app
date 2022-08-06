//
//  NewsViewController.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/1.
//

#import "NewsViewController.h"
#import "ViewController.h"
#import "DialogCellView.h"
#import "NormalTableViewCell.h"
#import "DetailViewController.h"
#import "ListLoader.h"
#import "ListItem.h"

@interface NewsViewController () <UITableViewDataSource, UITableViewDelegate, NormalTableViewCellDelegate>

@property(nonatomic, strong, readwrite) UITableView * tableView;
@property(nonatomic, strong, readwrite) NSArray * dataArray;
@property(nonatomic, strong, readwrite) ListLoader *listLoader;

@end

@implementation NewsViewController

- (instancetype) init {
    if (self = [super init]) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
        
//        _dataArray = @[].mutableCopy;
//        for(int i = 0; i < 20; i++) {
//            [_dataArray addObject:@(i)];
//        }
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"News viewDidLoad");
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    
    self.listLoader = [[ListLoader alloc] init];
    __weak typeof (self) wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<ListItem *> * _Nonnull dataArray) {
        __strong typeof (wself) strongSelf = wself;
//        NSLog(@"loadListDataWithFinishBlock - %@", dataArray);
        
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData
        ];
    }];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if (!cell) {
        cell = [[NormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }

//    cell.textLabel.text = @"Title";
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"sub title, %@-%@", @(indexPath.row), @(indexPath.row)];
//    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    DetailViewController *controller = [[DetailViewController alloc] init];

    ListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    DetailViewController *controller = [[DetailViewController alloc] initWithUrl:item.articleUrl];
    controller.navigationItem.title = [NSString stringWithFormat:@"详情 %@", @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark - NormalTableViewCellDelegate

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    NSLog(@"clickDeleteButton");
//    DialogCellView *deleteView = [[DialogCellView alloc] initWithFrame:self.view.bounds];
//
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//
//    __weak typeof (self) wself = self;
//    [deleteView showDialogViewFromPoint:rect.origin clickBlock:^{
//        __strong typeof (wself) strongSelf = wself;
//        [strongSelf.dataArray removeLastObject];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:tableViewCell]]
//                                    withRowAnimation:UITableViewRowAnimationLeft];
//    }];
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
