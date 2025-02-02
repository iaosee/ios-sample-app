//
//  SliderViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/8/3.
//

#import "SliderViewController.h"

@interface SliderViewController () <UIScrollViewDelegate>

@property(nonatomic, weak) UIScrollView *scrollView;
@property(nonatomic, weak) UIPageControl *pageControl;
@property(nonatomic, weak) NSTimer *timer;

@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 5, 0);
    
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = YES;
    
    scrollView.delegate = self;
    
    NSArray *colorArray = @[
        [UIColor redColor],
        [UIColor greenColor],
        [UIColor blueColor],
        [UIColor systemPinkColor],
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

    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollView.bounds) - 80, scrollView.frame.size.width, 30)];
    pageControl.numberOfPages = [colorArray count];
    pageControl.tintColor = [UIColor lightGrayColor];
    pageControl.currentPage = 0;

    [self.view addSubview:scrollView];
    [self.view addSubview:pageControl];
    self.scrollView = scrollView;
    self.pageControl = pageControl;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollContentHandler) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode: NSRunLoopCommonModes];
}

- (void) viewClickHandler {
    NSLog(@"viewClickHandler");
}

- (void) scrollContentHandler {
    NSInteger currentPage = self.pageControl.currentPage;
    NSInteger nextPage = (currentPage + 1) % self.pageControl.numberOfPages;
    CGFloat offsetX = self.scrollView.contentSize.width / self.pageControl.numberOfPages * nextPage;
    
    self.pageControl.currentPage = nextPage;
//    self.scrollView.contentOffset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll");
    
    CGFloat offsetX = scrollView.contentOffset.x;
    offsetX += scrollView.frame.size.width / 2;     // If half of the page, next / prev
    int page = offsetX / scrollView.frame.size.width;
    
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewWillBeginDragging");
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    NSLog(@"scrollViewDidEndDragging");
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollContentHandler) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode: NSRunLoopCommonModes];
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
