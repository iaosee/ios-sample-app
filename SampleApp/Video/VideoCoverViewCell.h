//
//  VideoCoverViewCell.h
//  SampleApp
//
//  Created by xiaofeng on 2022/8/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoCoverViewCell : UICollectionViewCell

-(void) layoutWithVideoCoverUrl: (NSString *) videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
