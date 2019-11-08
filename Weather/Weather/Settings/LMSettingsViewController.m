//
//  LMSettingsViewController.m
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMSettingsViewController.h"

@interface LMSettingsViewController ()

@end

@implementation LMSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    [self setNavigationBar];

}

-(void) setNavigationBar {
    
    self.navigationController.navigationBar.barTintColor = [UIColor getProjectColorDarkBlue];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = false;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}

@end
