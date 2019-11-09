//
//  LMTabBarViewController.m
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMTabBarViewController.h"
#import "LMFavoritesViewController.h"
#import "LMSettingsViewController.h"
#import "LMCitiesViewController.h"
#import "LMDetailedForecastViewController.h"
#import "LMFavoritesViewController.h"
#import "LMWeather.h"

@interface LMTabBarViewController ()

@end

@implementation LMTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

        NSMutableArray *viewControllersArray = [[NSMutableArray alloc] initWithCapacity:3];
    
        LMDetailedForecastViewController *currentViewController = [[LMDetailedForecastViewController alloc] init];
        currentViewController.tabBarItem.title= @"Location";
        currentViewController.tabBarItem.image = [UIImage imageNamed:@"location"];
            UINavigationController* currentNavViewController = [[UINavigationController alloc] initWithRootViewController:currentViewController];

        LMCitiesViewController *homeViewController = [[LMCitiesViewController alloc] init];
        homeViewController.tabBarItem.title = @"Home";
        homeViewController.tabBarItem.image = [UIImage imageNamed:@"home"];
        UINavigationController* citiesNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
        LMSettingsViewController *settingsViewController = [[LMSettingsViewController alloc] init];
        settingsViewController.tabBarItem.title = @"Settings";
        settingsViewController.tabBarItem.image = [UIImage imageNamed:@"settings"];
        UINavigationController* settingsNavViewController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    
        [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName:[UIFont setFontWithSize:12.0f]
                                                        } forState:UIControlStateNormal];
    
        [viewControllersArray addObject:currentNavViewController];
        [viewControllersArray addObject:citiesNavigationController];
        [viewControllersArray addObject:settingsNavViewController];
    
        self.viewControllers = viewControllersArray;
        self.selectedIndex = 1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)init {
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{

    int  selectedTabInt = (int) self.selectedIndex;
    if (selectedTabInt == 0) {
        
        [[LMFavoritesViewController sharedInstance] getLocation];
        [LMWeather sharedInstance].isCurrentLocation = YES;

    }else{
        [LMWeather sharedInstance].isCurrentLocation = NO;
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
