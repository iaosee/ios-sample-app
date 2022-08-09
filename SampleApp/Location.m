//
//  Location.m
//  SampleApp
//
//  Created by 肖峰 on 2022/8/9.
//

#import "Location.h"
#import <CoreLocation/CoreLocation.h>

@interface Location() <CLLocationManagerDelegate>

@property(nonatomic, strong, readwrite) CLLocationManager *manager;

@end

@implementation Location

+ (Location *) locationManager {
    static Location *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[Location alloc] init];
    });
    return location;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}

- (void) checkLocationAuthorization {
    // 系统未开启
    if (![CLLocationManager locationServicesEnabled]) {
        
    }
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.manager requestWhenInUseAuthorization];
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if ( status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.manager startUpdatingHeading];
    } else if (status == kCLAuthorizationStatusDenied) {
        
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"didUpdateLocations - %@", locations);
//    TODO
    
    
    [self.manager stopUpdatingLocation];
}
@end
