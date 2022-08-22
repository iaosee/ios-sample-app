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

@interface TableView03Controller () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *messageFrames;

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
            
            model.hiddenTime = [model.time isEqualToString:lastMessage.time];
            modelFrame.message = model;

            [arrModels addObject:modelFrame];
        }
        _messageFrames = arrModels;
    }

    return _messageFrames;
}

- (instancetype) init {
    if (self = [super init]) {
//        TODO
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1.0];
    self.tableView.allowsSelection = NO;
    
    NSNotificationCenter *notifyCenter = [NSNotificationCenter defaultCenter];
    [notifyCenter addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [self scrollToBottom:YES];
}

- (void) keyboardWillChangeFrame: (NSNotification *)notification {
    CGRect rect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat transformY = rect.origin.y - self.view.frame.size.height;
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, transformY);
    }];
    [self scrollToBottom:YES];
}

- (void) sendMessage:(NSString *)text type:(MessageType)type {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString *time = [formatter stringFromDate:[NSDate now]];
    NSDictionary *dict = @{
        @"text": text,
        @"icon": MessageTypeTo == type ? @"apple-logo" : @"icloud",
        @"time": time,
        @"type": @(type),
    };
    SAMessage *message = [SAMessage messageWithDict:dict];
    SAMessageFrame *messageFrame = [[SAMessageFrame alloc] init];
    
    SAMessage *lastMessage = (SAMessage *)[[self.messageFrames lastObject] message];
    if ([lastMessage.time isEqualToString:time]) {
        message.hiddenTime = YES;
    }
 
    messageFrame.message = message;

    [self.messageFrames addObject:messageFrame];
    [self.tableView reloadData];
    [self scrollToBottom:YES];
}

- (void) scrollToBottom:(BOOL) animated {
    NSIndexPath *lastRowIndex = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastRowIndex atScrollPosition:UITableViewScrollPositionTop animated:animated];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAMessageFrame *frame = self.messageFrames[indexPath.row];
    return frame.rowHeight;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
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

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *text = textField.text;
    
    if([text isEqualToString:@""]) {
        return YES;
    }
    [self sendMessage:text type:MessageTypeTo];
    [self sendMessage:text type:MessageTypeFrom];
    textField.text = nil;
    return YES;
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
