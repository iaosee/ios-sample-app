//
//  NewsViewController.m
//  SampleApp
//
//  Created by iaosee on 2022/8/2.
//

#import "VideoViewController.h"
#import "VideoCoverViewCell.h"
#import "VideoToolbar.h"
#import "VideoPlayer.h""

@interface VideoViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation VideoViewController

- (instancetype) init {
    if (self = [super init]) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
//    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - flowLayout.minimumInteritemSpacing) / 2, 300);
    flowLayout.itemSize = CGSizeMake(
                                     self.view.frame.size.width,
                                     self.view.frame.size.width / (16.f/9.f) + VideoToolbarHeight);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
//    collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    collectionView.delegate = self;
    collectionView.dataSource = self;

    [collectionView registerClass:[VideoCoverViewCell class] forCellWithReuseIdentifier:@"VideoCoverViewCell"];

    [self.view addSubview:collectionView];
}

- (void)viewDidDisappear:(BOOL)animated {
    [[VideoPlayer Player] stopPlay];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCoverViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor = indexPath.row % 3 ? [UIColor greenColor] : [UIColor blueColor];
    
//    http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
    if  ([cell isKindOfClass:[VideoCoverViewCell class]]) {
        [(VideoCoverViewCell *)cell layoutWithVideoCoverUrl:@"icon.bundle/videoCover@3x.png"
                                                   videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
        
    }
    
    return cell;
}

//- (CGSize) collectionView: (UICollectionView *) collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//    if (indexPath.row % 3 == 0) {
//        return CGSizeMake(self.view.frame.size.width, self.view.frame.size.width / (16.f/9.f));
//    }
//
//    return CGSizeMake((self.view.frame.size.width - 10) / 2, 300);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
