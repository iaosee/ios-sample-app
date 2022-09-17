//
//  UIImageView+WebImageCache.m
//  SampleApp
//
//  Created by iaosee on 2022/9/11.
//

#import "UIImageView+WebImageCache.h"
#import "WebImageDownloadManager.h"

@implementation UIImageView (WebImageCache)

- (void)setWebImageWithURL:(NSString *)url {
    [WebImageDownloadManager.sharedManager downloadWithURLString:url finishedBlock:^(UIImage *img) {
        self.image = img;
    }];
}

@end
