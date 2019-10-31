//
//  LMMainViewController.m
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMMainViewController.h"
#import "LMTabBarViewController.h"

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
    NSLog(@"LM setNavigationBar");

    _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, UIApplication.sharedApplication.statusBarFrame.size.height, self.view.frame.size.width, 50)];
    //    self.navigationItem.title = @"The title";
    //    UIBarButtonItem *exampleButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"button.png"] style:UIBarButtonItemStylePlain target:self action:@selector(btnClicked:)];
    //
    //    [self.view addSubview:_navBar];
    
    
    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:@"TITLE"];
    // [navbar setBarTintColor:[UIColor lightGrayColor]];
    UIBarButtonItem* leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onTapLeftButton:)];
    navItem.leftBarButtonItem = leftBarButton;
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]
                                       initWithTitle:@"Add"
                                       style:UIBarButtonItemStylePlain
                                       target:self
                                       action:@selector(onTapRigtButton:)];
    
    //    UIBarButtonItem* rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onTapRigtButton:)];
    navItem.rightBarButtonItem = rightBarButton;
    
    [_navBar setItems:@[navItem]];
    [self.view addSubview:_navBar];
    
    //  [LMMainViewController didMoveToParentViewController:self];
    
    
}

-(void) setTabBar {
    
    LMTabBarViewController *tabBarController = [[LMTabBarViewController alloc] init];
    //  [tabBarController.view removeFromSuperview];
    //    [tabBarController willMoveToParentViewController:self];
    
    [self.view addSubview:tabBarController.view];
    
    [self addChildViewController:tabBarController];
    
}
-(void) add {
    NSLog(@"LM Add ");
    
}
-(void) onTapRigtButton:(id)sender {
    NSLog(@"LM onTapRigtButton ");
    
}
-(void) onTapLeftButton:(UIBarButtonItem*)item{
    NSLog(@"LM onTapLeftButton ");
    
}
@end
