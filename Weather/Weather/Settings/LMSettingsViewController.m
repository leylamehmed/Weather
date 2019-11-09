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
    NSString *text = @"Coming Soon";
    CGSize labelSize = [text sizeWithFont:[UIFont getProjectFont] constrainedToSize:CGSizeMake(380, 20) lineBreakMode:NSLineBreakByTruncatingTail];
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, labelSize.width, labelSize.height)];
    fromLabel.text = text;
    fromLabel.font = [UIFont getProjectFont];
    fromLabel.numberOfLines = 1;
    fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    fromLabel.adjustsFontSizeToFitWidth = YES;
    fromLabel.adjustsLetterSpacingToFitWidth = YES;
    fromLabel.minimumScaleFactor = 10.0f/12.0f;
    fromLabel.clipsToBounds = YES;
    fromLabel.backgroundColor = [UIColor clearColor];
    fromLabel.textColor = [UIColor getProjectColorDarkBlue];
    fromLabel.textAlignment = NSTextAlignmentLeft;
    
    
    [self.view addSubview:fromLabel];

}

-(void) setNavigationBar {
    
    self.navigationController.navigationBar.barTintColor = [UIColor getProjectColorDarkBlue];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = false;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}

@end
