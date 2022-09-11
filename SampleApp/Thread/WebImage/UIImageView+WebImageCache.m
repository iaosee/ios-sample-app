//
//  UIImageView+WebImageCache.m
//  SampleApp
//
//  Created by iaosee on 2022/9/11.
//

#import "UIImageView+WebImageCache.h"
#import "DownloadManager.h"

@implementation UIImageView (WebImageCache)

- (void)setWebImageWithURL:(NSString *)url {
    [DownloadManager.sharedManager downloadWithURLString:url finishedBlock:^(UIImage *img) {
        self.image = img;
    }];
}

@end
