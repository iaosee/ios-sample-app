//
//  VideoPlayer.m
//  SampleApp
//
//  Created by iaosee on 2022/8/7.
//

#import "VideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoPlayer()

@property(nonatomic, strong, readwrite) AVPlayer *player;
@property(nonatomic, strong, readwrite) AVPlayerItem *playerItem;
@property(nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;

@end

@implementation VideoPlayer

+ (VideoPlayer *) Player {
    static VideoPlayer * player;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        player = [[VideoPlayer alloc] init];
    });
    
    return player;
}

- (void) playVideoWithUrl: (NSString *) videoUrl attachView: (UIView *) attachView {
    [self stopPlay];
    
    NSURL *url = [NSURL URLWithString:videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:url];
    
    _playerItem = [AVPlayerItem playerItemWithAsset:asset];
    _player = [AVPlayer playerWithPlayerItem:_playerItem];
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];

    [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    _playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:_playerLayer];
    
    CMTime duration = _playerItem.duration;
    CGFloat videoDuration = CMTimeGetSeconds(duration);
    NSLog(@"videoDuration - %f", videoDuration);

    [_player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度 - %f", CMTimeGetSeconds(time));
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_playEndHandler)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:nil];
}


- (void) _tapPlayButtonHandler {
//    [_player play];
}

- (void) stopPlay {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_playerItem removeObserver:self forKeyPath:@"status" context:nil];
    [_playerItem removeObserver:self forKeyPath:@"loadedTimeRanges" context:nil];
    
    [_player pause];
    [_playerLayer removeFromSuperlayer];
    _playerItem = nil;
    _player = nil;
}

- (void) _playEndHandler {
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
}

#pragma mark KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if(((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerStatusReadyToPlay) {
            [_player play];
        } else {
            NSLog(@"AVPlayerStatus - %@", change);
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSLog(@"缓冲 - %@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}

@end
