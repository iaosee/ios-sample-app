//
//  AppTableViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/9/10.
//

#import "AppTableViewController.h"
#import "AppModel.h"
#import "AppTableViewCell.h"
#import "NSString+Hash.h"
#import "NSString+Sandbox.h"

@interface AppTableViewController ()
@property(nonatomic, strong) NSArray *appList;
@property(nonatomic, strong) NSOperationQueue *queue;
@property(nonatomic, strong) NSMutableDictionary<NSString *, UIImage *> *imageCahce;
@property(nonatomic, strong) NSMutableDictionary<NSString *, NSOperation *> *operationCache;
@end

@implementation AppTableViewController

- (NSArray *)appList {
    if (_appList == nil) {
        _appList = [AppModel apps];
    }
    return _appList;
}
- (NSOperationQueue *)queue {
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}
- (NSMutableDictionary<NSString *, UIImage *> *)imageCahce {
    if (_imageCahce == nil) {
        _imageCahce = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _imageCahce;
}
- (NSMutableDictionary<NSString *,NSOperation *> *)operationCache {
    if (_operationCache == nil) {
        _operationCache = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _operationCache;
}

- (void)dealloc {
    NSLog(@"%@ dealloc", [self class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES));
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

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
//    NSString *iconUrl = [NSString stringWithFormat:@"%@.png", [item.iconUrl stringByDeletingPathExtension]];
//    item.iconUrl = iconUrl;

    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.desc;
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.imageView.layer.cornerRadius = 15;
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.borderWidth = 6;
    cell.imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/icon.png"];

    if (self.imageCahce[item.iconUrl]) {
        NSLog(@"Loading iamge from memory cache.");
        cell.imageView.image = self.imageCahce[item.iconUrl];
        return cell;
    }
    if (self.operationCache[item.iconUrl]) {
        NSLog(@"Already started download.");
        return cell;
    }

    NSData *imgData = [NSData dataWithContentsOfFile:[[item.iconUrl SHA1] appendCache]];
    if (imgData) {
        NSLog(@"Loading image from sandbox cache.");
        UIImage *img = [UIImage imageWithData:imgData];
        self.imageCahce[item.iconUrl] = img;
        cell.imageView.image = img;
        return cell;
    }
    
    [self downloadImage:indexPath];

    return cell;
}

- (void) downloadImage:(NSIndexPath *)indexPath {
    AppModel *item = self.appList[indexPath.row];

//    __weak typeof (self) wkSelf = self;
    NSOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"Downloading from network ...");
        if (indexPath.row < 9) {
            [NSThread sleepForTimeInterval:2.5];
        } else {
            [NSThread sleepForTimeInterval:5];
        }

        NSURL *url = [NSURL URLWithString:item.iconUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];

        if (img) {
            [data writeToFile:[[item.iconUrl SHA1] appendCache] atomically:YES];
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (!img) {
                return;
            }
            [self.imageCahce setValue:img forKey:item.iconUrl];
            [self.operationCache removeObjectForKey:item.iconUrl];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }];

    [self.queue addOperation:op];
    [self.operationCache setValue:op forKey:item.iconUrl];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Queue Operation Count: %zd", (unsigned long)self.queue.operationCount);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self.queue cancelAllOperations];
}

- (void)didReceiveMemoryWarning {
    [self.imageCahce removeAllObjects];
    [self.operationCache removeAllObjects];
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
