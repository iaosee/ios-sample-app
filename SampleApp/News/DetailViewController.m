//
//  DetailViewController.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/4.
//

#import "DetailViewController.h"
#import "ScreenAdapter.h"

@interface DetailViewController () <WKNavigationDelegate>

@property(nonatomic, strong, readwrite) WKWebView *webView;
@property(nonatomic, strong, readwrite) UIProgressView *progressView;
@property(nonatomic, copy, readwrite) NSString *url;

@end

@implementation DetailViewController

- (instancetype) init {
    return [self initWithUrl: @"https://time.geekbang.org"];
}

- (instancetype) initWithUrl:(NSString *) url {
    self = [super init];

    if (self) {
        self.url = url;
    }

    return self;
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress" context:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    const int height = STATUSBARHEIGHT + 44;
    const int height = 40 + 44;
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc]
                        initWithFrame:CGRectMake(
                                                 0,
                                                 height,
                                                 self.view.frame.size.width,
                                                 self.view.frame.size.height - height
                                                 )];
        self.webView;
    })];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, height, self.view.frame.size.width, 2)];
        self.progressView.progressViewStyle = UIProgressViewStyleBar;
        self.progressView;
    })];
    
    
    [self.webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {

    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"webView didFinishNavigation");
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if(self.webView.estimatedProgress == 1) {
        self.progressView.hidden = YES;
    } else {
        self.progressView.hidden = NO;
    }
    [self.progressView setProgress:self.webView.estimatedProgress];
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
