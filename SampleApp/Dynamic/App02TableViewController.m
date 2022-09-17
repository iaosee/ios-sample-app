//
//  App02TableViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/9/11.
//

#import "App02TableViewController.h"
#import "AppModel.h"
#import "AppTableViewCell.h"
#import "NSString+Hash.h"
#import "NSString+Sandbox.h"
#import "WebImageDownloadManager.h"
#import "UIImageView+WebImageCache.h"

@interface App02TableViewController ()
@property(nonatomic, strong) NSArray *appList;
@end

@implementation App02TableViewController

- (NSArray *)appList {
    if (_appList == nil) {
        _appList = [AppModel apps];
    }
    return _appList;
}
- (void)dealloc {
    NSLog(@"%@ dealloc", [self class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES));
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseId = @"appCellReuseId";
    
    AppTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[AppTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }

    AppModel *item = self.appList[indexPath.row];
    NSString *iconUrl = [NSString stringWithFormat:@"%@.png", [item.iconUrl stringByDeletingPathExtension]];
    item.iconUrl = iconUrl;

    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.desc;
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.imageView.layer.cornerRadius = 15;
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.borderWidth = 6;
    cell.imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/icon.png"];
    
    [cell.imageView setWebImageWithURL:item.iconUrl];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath: %zd", indexPath.row);
}

- (void)didReceiveMemoryWarning {
    
}

@end
