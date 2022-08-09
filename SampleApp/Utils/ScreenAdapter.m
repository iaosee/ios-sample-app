//
//  ScreenAdapter.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/8.
//

#import "ScreenAdapter.h"

@implementation ScreenAdapter


//iphone xs max
+ (CGSize)sizeFor65Inch{
    return CGSizeMake(414,896);
}

//iphone xr
+ (CGSize)sizeFor61Inch{
    return CGSizeMake(414,896);
}

// iphonex
+ (CGSize)sizeFor58Inch{
    return CGSizeMake(375,812);
}

@end
