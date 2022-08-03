//
//  RecommendController.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/2.
//

#import "RecommendController.h"

@interface RecommendController () <UIScrollViewDelegate>

@end

@implementation RecommendController

- (instancetype) init {
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor purpleColor];
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = YES;
    
    scrollView.delegate = self;
    
    NSArray *colorArray = @[
        [UIColor redColor],
        [UIColor greenColor],
        [UIColor blueColor],
        [UIColor yellowColor],
        [UIColor orangeColor],
    ];

    for (int i = 0; i < 5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:
                            CGRectMake(
                                       scrollView.bounds.size.width * i,
                                       0,
                                       scrollView.bounds.size.width,
                                       scrollView.bounds.size.height)
            ];
            view.backgroundColor = [colorArray objectAtIndex:i];
            
            [view addSubview:({
                UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(view.bounds.size.width / 2 - 50, view.bounds.size.width / 2 - 50, 100, 100)];
                subView.backgroundColor = [UIColor grayColor];
                
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClickHandler)];
                [view addGestureRecognizer:tapGesture];
                
                subView;
            })];
            
            view;
        })];
    }

    [self.view addSubview:scrollView];
}

- (void) viewClickHandler {
    NSLog(@"viewClickHandler");
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging");
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
