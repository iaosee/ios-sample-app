//
//  Location.h
//  SampleApp
//
//  Created by 肖峰 on 2022/8/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Location : NSObject

+ (Location *) locationManager;
- (void) checkLocationAuthorization;

@end

NS_ASSUME_NONNULL_END
