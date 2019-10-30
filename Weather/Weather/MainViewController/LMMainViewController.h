//
//  LMMainViewController.h
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMMainViewController : UIViewController

+ (LMMainViewController *)sharedInstance;
- (instancetype) init;

@property (strong, nonatomic) UINavigationBar* navBar;

@end

NS_ASSUME_NONNULL_END
