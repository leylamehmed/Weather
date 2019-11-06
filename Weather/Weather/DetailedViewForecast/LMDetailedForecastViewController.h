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


//@property (nonatomic, strong) NSString *cityName;
//@property (nonatomic, strong) NSString *parentLocationTitle;
//@property (nonatomic, strong) NSString *maxTemp;
//@property (nonatomic, strong) NSString *minTemp;
//@property (nonatomic, strong) NSString *theTemp;
//@property (nonatomic, strong) NSString *visibility;
//@property (nonatomic, strong) NSString *weatherStateName;
//@property (nonatomic, strong) NSString *weatherStateAbbr;
//@property (nonatomic, strong) NSString *sunRise;
//@property (nonatomic, strong) NSString *sunSet;
//@property (nonatomic, strong) NSString *time;
//@property (nonatomic, strong) NSString *timeZoneCity;
//@property (nonatomic, strong) NSString *airPressure;
//@property (nonatomic, strong) NSString *applicableDate;
//@property (nonatomic, strong) NSString *created;
//@property (nonatomic, strong) NSString *humidity;
//@property (nonatomic, strong) NSString *windDirection;
//@property (nonatomic, strong) NSString *windDirectionCompass;
//@property (nonatomic, strong) NSString *windSpeed;

@end

NS_ASSUME_NONNULL_END
