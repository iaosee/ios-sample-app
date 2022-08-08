//
//  ScreenAdapter.h
//  SampleApp
//
//  Created by 肖峰 on 2022/8/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define UI(x) UIAdapter(x)
#define UIRect(x, y, w, h) UIRectAdapter(x, y, w, h)

static inline NSInteger UIAdapter(float x) {
    CGFloat sclae = 375 / SCREEN_WIDTH;
    return (NSInteger)x / sclae;
}

static inline CGRect UIRectAdapter(x, y, w, h) {
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(w), UIAdapter(h));
}

@interface ScreenAdapter : NSObject


@end

NS_ASSUME_NONNULL_END
