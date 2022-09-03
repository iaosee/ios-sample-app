//
//  CommentManager.h
//  SampleApp
//
//  Created by iaosee on 2022/8/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentManager : NSObject

+ (CommentManager *) sharedManager;

- (void)showCommentView;

@end

NS_ASSUME_NONNULL_END
