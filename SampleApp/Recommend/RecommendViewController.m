//
//  RecommendViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/8/2.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()

@property(weak, nonatomic) NSArray *apps;

@end

@implementation RecommendViewController

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

- (instancetype) init {
    if (self = [super init]) {
//        self.view.backgroundColor = [UIColor purpleColor];
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
}

- (void) initView {
    
    int columns = 4;
    CGFloat viewWidth = self.view.frame.size.width;
    
    CGFloat itemWidth = 75;
    CGFloat itemHeight = 70;
    CGFloat marginTop = 80;
    CGFloat marginX = (viewWidth  - columns * itemWidth) / (columns + 1);
    CGFloat marginY = marginX;
    
    for (int i = 0; i < self.apps.count; i++) {
        NSString *item = self.apps[i];
        
        UIView *itemView = [[UIView alloc] init];
//        itemView.backgroundColor = [UIColor lightGrayColor];
        
        int colIndex = i % columns;
        int rowIndex = i / columns;
        CGFloat itemX = marginX + colIndex * (itemWidth + marginX);
        CGFloat itemY = marginTop + rowIndex * (itemHeight + marginY);
        itemView.frame = CGRectMake(itemX, itemY, itemWidth, itemHeight);
        [self.view addSubview:itemView];
        
        CGFloat iconWidth = 50;
        CGFloat iconHeight = 50;
        CGFloat iconX = (itemView.frame.size.width - iconWidth) / 2;
        CGFloat iconY = 0;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
        imageView.image = [UIImage imageNamed:item];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, iconHeight, itemView.frame.size.width, 20);
        label.text = item;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        
        [itemView addSubview:imageView];
        [itemView addSubview:label];
    }
    
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
