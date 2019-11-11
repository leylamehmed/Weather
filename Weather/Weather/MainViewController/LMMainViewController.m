//
//  LMMainViewController.m
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMMainViewController.h"
#import "LMTabBarViewController.h"
#import "LMFavoritesViewController.h"
@interface LMMainViewController ()

@end

@implementation LMMainViewController

//+ (LMMainViewController *)sharedInstance {
//    static dispatch_once_t onceToken;
//    static LMMainViewController *instance = nil;
//    dispatch_once(&onceToken, ^{
//        instance = [[LMMainViewController alloc] initWithNibName:@"LMMainViewController" bundle:nil];
//    });
//    return instance;
//}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [[LMFavoritesViewController sharedInstance] getLocation];

    // Set setTabBar
    [self setTabBar];
}

-(void) setTabBar {
    
    LMTabBarViewController *tabBarController = [[LMTabBarViewController alloc] init];

    [self.view addSubview:tabBarController.view];

    [self addChildViewController:tabBarController];
}


@end
