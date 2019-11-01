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
#import "UIFont+LMSystemFontOverride.h"

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
    
        LMFavoritesViewController *favoritesViewController = [[LMFavoritesViewController alloc] init];
        favoritesViewController.tabBarItem.title= @"Favorites";
    
        LMCitiesViewController *homeViewController = [[LMCitiesViewController alloc] init];
        homeViewController.tabBarItem.title = @"Home";
    
        //    favoritesViewController.tabBarItem.image=[UIImage];
    
        LMSettingsViewController *settingsViewController = [[LMSettingsViewController alloc] init];
        settingsViewController.tabBarItem.title = @"Settings";
        [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName:[UIFont setFontWithSize:12.0f]
                                                        } forState:UIControlStateNormal];
    
        [viewControllersArray addObject:favoritesViewController];
        [viewControllersArray addObject:homeViewController];
        [viewControllersArray addObject:settingsViewController];
    
        self.viewControllers = viewControllersArray;
        self.view.autoresizingMask=(UIViewAutoresizingFlexibleHeight);
        self.selectedIndex = 1;
    

}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
- (id)init {
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"SELECT");
    UILabel* titleLabel = (UILabel*)self.navigationItem.titleView ;

    self.navigationItem.rightBarButtonItem = viewController.navigationItem.rightBarButtonItem;
    self.navigationItem.backBarButtonItem = viewController.navigationItem.backBarButtonItem;
    self.title = viewController.title;
    titleLabel.text = self.title;
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
