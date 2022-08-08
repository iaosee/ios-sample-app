//
//  VideoCoverViewCell.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/6.
//

#import "VideoCoverViewCell.h"
#import "VideoPlayer.h"

@interface VideoCoverViewCell()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, copy, readwrite) NSString *videoUrl;

@end

@implementation VideoCoverViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:
                          CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _coverView;
        })];
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:
                           CGRectMake((frame.size.width - 50) / 2, (frame.size.height - 50) / 2, 50, 50)];
            _playButton;
        })];
        
        UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlayHandler)];
        [self addGestureRecognizer:tapGesture];
        
    }
    
    return self;
}

- (void)dealloc {
    
}

-(void) layoutWithVideoCoverUrl: (NSString *) videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
    _videoUrl = videoUrl;
}

- (void) _tapToPlayHandler {
    VideoPlayer *player = [VideoPlayer Player];
    [player playVideoWithUrl:_videoUrl attachView:_coverView];
}
@end