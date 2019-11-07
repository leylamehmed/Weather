//
//  LMDetailedForecastViewController.h
//  Weather
//
//  Created by LeyLa Mehmed on 6.11.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMDetailedForecastViewController : UIViewController

@property(strong,nonatomic) NSDictionary *selectedCityDict;
@property(strong,nonatomic) NSDictionary *selectedDayDict;

@property (weak, nonatomic) IBOutlet UILabel *cityNameParentLoc;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *sunrise;
@property (weak, nonatomic) IBOutlet UILabel *sunset;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *theTemp;
@property (weak, nonatomic) IBOutlet UILabel *weatherStateName;
@property (weak, nonatomic) IBOutlet UILabel *minMaxTemp;
@property (weak, nonatomic) IBOutlet UILabel *windSpeed;
@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *airPressure;
@property (weak, nonatomic) IBOutlet UILabel *visibility;

@property (weak, nonatomic) IBOutlet UILabel *confidence;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;



@end

NS_ASSUME_NONNULL_END
