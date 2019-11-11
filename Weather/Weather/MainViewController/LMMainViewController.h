//
//  LMMainViewController.h
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMMainViewController : UIViewController <UIBarPositioningDelegate>

+ (LMMainViewController *)sharedInstance;
- (instancetype) init;

@property (strong, nonatomic) UINavigationBar* navBar;
@property (strong, nonatomic) UIView * myView;
@property (strong, nonatomic) UIWindow *window;
@end

NS_ASSUME_NONNULL_END
