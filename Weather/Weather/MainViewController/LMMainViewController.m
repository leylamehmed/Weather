//
//  LMMainViewController.m
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMMainViewController.h"
#import "LMTabBarViewController.h"
#import "UILabel+LMLabel.h"
#import "UIColor+LMColor.h"
#import "UIFont+LMSystemFontOverride.h"

@interface LMMainViewController ()

@end

@implementation LMMainViewController

+ (LMMainViewController *)sharedInstance {
    static dispatch_once_t onceToken;
    static LMMainViewController *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[LMMainViewController alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = true;
    

    // Set setTabBar
    [self setTabBar];
    
    //Set navigationBar
    [self setNavigationBar];
//    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self setEdgesForExtendedLayout:UIRectEdgeNone];

}

-(void) setNavigationBar {
//    UIApplication.sharedApplication.statusBarFrame.size.height
    _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, UIApplication.sharedApplication.statusBarFrame.size.height, self.view.frame.size.width, 50)];
    _navBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.parentViewController setNeedsStatusBarAppearanceUpdate];
//    _navBar.translatesAutoresizingMaskIntoConstraints = false;

    _navBar.barTintColor = [UIColor colorFromHexString:@"#c0d9f2"];
    _navBar.translucent=false;
    
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"Weather"];
  
    [_navBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor getProjectColor],
       NSFontAttributeName:[UIFont setFontWithSize:17.0f]}];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onTapAddButton:)];
    navItem.rightBarButtonItem = rightBarButton;
    

    [_navBar setItems:@[navItem]];
    [self.view addSubview:_navBar];
    
}

-(void) setTabBar {
    
    LMTabBarViewController *tabBarController = [[LMTabBarViewController alloc] init];
    [self.view addSubview:tabBarController.view];

    [self addChildViewController:tabBarController];
    
}

-(void) onTapAddButton:(id)sender {
    NSLog(@"LM onTapRigtButton ");
}

//- (BOOL)prefersStatusBarHidden
//{
//    return UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]);
//}
//
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
//
//}

@end
