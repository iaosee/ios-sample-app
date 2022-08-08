//
//  VideoCoverViewCell.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/6.
//

#import "VideoCoverViewCell.h"
#import "VideoPlayer.h"
#import "VideoToolbar.h"

@interface VideoCoverViewCell()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, copy, readwrite) NSString *videoUrl;
@property(nonatomic, copy, readwrite) VideoToolbar *toolbar;

@end

@implementation VideoCoverViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:
                          CGRectMake(0, 0, frame.size.width, frame.size.height - VideoToolbarHeight)];
            _coverView;
        })];
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:
                           CGRectMake((frame.size.width - 50) / 2, (frame.size.height - 50 - VideoToolbarHeight) / 2, 50, 50)];
            _playButton;
        })];

        [self addSubview:({
            _toolbar = [[VideoToolbar alloc] initWithFrame:
                        CGRectMake(0, _coverView.bounds.size.height, frame.size.width, VideoToolbarHeight)];
            _toolbar;
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
    [_toolbar layoutWithModel:self];
}

- (void) _tapToPlayHandler {
    VideoPlayer *player = [VideoPlayer Player];
    [player playVideoWithUrl:_videoUrl attachView:_coverView];
}
@end
