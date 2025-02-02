//
//  ScreenAdapter.h
//  SampleApp
//
//  Created by iaosee on 2022/8/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)


#define IS_IPHONE_X_XR_MAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)

#define IS_IPHONE_X (SCREEN_WIDTH == [ScreenAdapter sizeFor58Inch].width && SCREEN_HEIGHT == [ScreenAdapter sizeFor58Inch].height)
#define IS_IPHONE_XR (SCREEN_WIDTH == [ScreenAdapter sizeFor61Inch].width && SCREEN_HEIGHT == [ScreenAdapter sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)
#define IS_IPHONE_XMAX (SCREEN_WIDTH == [ScreenAdapter sizeFor65Inch].width && SCREEN_HEIGHT == [ScreenAdapter sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)

#define STATUSBARHEIGHT (IS_IPHONE_X_XR_MAX ? 44 : 20)


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

//iphone xs max
+ (CGSize)sizeFor65Inch;

//iphone xr
+ (CGSize)sizeFor61Inch;

// iphonex
+ (CGSize)sizeFor58Inch;

//...其它机型


@end

NS_ASSUME_NONNULL_END
