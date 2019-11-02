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

    // Set setTabBar
    [self setTabBar];

    //Set navigationBar
    [self setNavigationBar];
    

}

-(void) setNavigationBar {

    _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    _navBar.barTintColor = [UIColor getProjectColorDarkBlue];
    _navBar.tintColor = [UIColor whiteColor];

    _navBar.translucent=false;

    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"Weather"];

    [_navBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[UIFont setFontWithSize:17.0f]}];

    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onTapAddButton:)];
    navItem.rightBarButtonItem = rightBarButton;

    
    [_navBar setItems:@[navItem]];
    [self.view addSubview:_navBar];
    
    _navBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_navBar];
    if (@available(iOS 11, *)) {
        UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
        [_navBar.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
        [_navBar.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
        [_navBar.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
       // [_navBar.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
    } else {
        UILayoutGuide *margins = self.view.layoutMarginsGuide;
        [_navBar.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
        [_navBar.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
        [_navBar.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor].active = YES;
//        [_navBar.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide.topAnchor].active = YES;
        
    }
    
    [self.view layoutIfNeeded];
    
}

-(void) setTabBar {
    
    LMTabBarViewController *tabBarController = [[LMTabBarViewController alloc] init];

    [self.view addSubview:tabBarController.view];

    [self addChildViewController:tabBarController];
}

-(void) onTapAddButton:(id)sender {
    NSLog(@"LM onTapRigtButton ");
}
@end
