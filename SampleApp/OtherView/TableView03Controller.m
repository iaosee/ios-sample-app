//
//  TableView03Controller.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/21.
//

#import "TableView03Controller.h"
#import "SAMessage.h"
#import "SAMessageFrame.h"
#import "MessageCell.h"

@interface TableView03Controller () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *messageFrames;

@end

@implementation TableView03Controller


- (NSMutableArray *)messageFrames {
    
    if (_messageFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *arrDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrModels = [NSMutableArray array];
        for (NSDictionary *dict in arrDict) {
            SAMessage *model = [[SAMessage alloc] initWithDict:dict];
            SAMessageFrame *modelFrame = [[SAMessageFrame alloc] init];
            SAMessage *lastMessage = (SAMessage *)[[arrModels lastObject] message];
            
            modelFrame.message = model;
            model.hiddenTime = [model.time isEqualToString:lastMessage.time];
            [arrModels addObject:modelFrame];
        }
        _messageFrames = arrModels;
    }

    return _messageFrames;
}

- (instancetype) init {
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1.0];
    self.tableView.allowsSelection = NO;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAMessageFrame *frame = self.messageFrames[indexPath.row];
    return frame.rowHeight;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAMessageFrame *itemFrame = self.messageFrames[indexPath.row];
    MessageCell *cell = [MessageCell messageCellWithTableView:tableView];
    cell.messageFrame = itemFrame;
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
