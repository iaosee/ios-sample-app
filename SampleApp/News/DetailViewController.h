//
//  DetailViewController.h
//  SampleApp
//
//  Created by iaosee on 2022/8/4.
//

#import <UIKit/UIKit.h>
#import <Webkit/WebKit.h>
#import "Mediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController <DetailViewControllerProtocol>

- (instancetype) initWithUrl:(NSString *) url;

@end

NS_ASSUME_NONNULL_END
