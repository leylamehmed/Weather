//
//  LMDetailedForecastViewController.m
//  Weather
//
//  Created by LeyLa Mehmed on 6.11.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMDetailedForecastViewController.h"
#import "LMWeatherData.h"
#import "LMWeather.h"

@interface LMDetailedForecastViewController ()
@property LMWeather *weather;
@property LMWeatherData *weatherData;
@end

@implementation LMDetailedForecastViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _weather = [LMWeather sharedInstance];
    _weatherData = [LMWeatherData sharedInstance];
    
    _selectedCityDict = _weather.selectedCityDict;
    _selectedDayDict  = _weather.selectedDayDict;
    
    //Set title
    NSString *dateString = [_weather getDateString:_selectedDayDict[@"applicable_date"]];
    self.navigationItem.title = dateString;
    
    [self setContent];
    
}

-(void) setContent {
    
//    @property (weak, nonatomic) IBOutlet UILabel *cityNameParentLoc;
//    @property (weak, nonatomic) IBOutlet UILabel *time;
//    @property (weak, nonatomic) IBOutlet UILabel *sunrise;
//    @property (weak, nonatomic) IBOutlet UILabel *sunset;
//    @property (weak, nonatomic) IBOutlet UIImageView *icon;
//    @property (weak, nonatomic) IBOutlet UILabel *theTemp;
//    @property (weak, nonatomic) IBOutlet UILabel *weatherStateName;
//    @property (weak, nonatomic) IBOutlet UILabel *minMaxTemp;
//    @property (weak, nonatomic) IBOutlet UILabel *windSpeed;
//    @property (weak, nonatomic) IBOutlet UILabel *humidity;
//    @property (weak, nonatomic) IBOutlet UILabel *airPressure;
    
//    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    self.cityNameParentLoc.text = [NSString stringWithFormat:@"%@, %@",  _selectedCityDict[@"title"], _selectedCityDict[@"parent"][@"title"]];
    
    NSString *fromFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ";
    NSString *toFormat = @"HH:mm a";
    

    NSString *timeStr = [_weather convertDate:_selectedCityDict[@"time"] fromFormat:fromFormat toFormat:toFormat];

    NSString *sunriseStr = [_weather convertDate:_selectedCityDict[@"sun_rise"] fromFormat:fromFormat toFormat:toFormat];
    
    NSString *sunsetStr = [_weather convertDate:_selectedCityDict[@"sun_set"] fromFormat:fromFormat toFormat:toFormat];
    
    self.time.text =  [NSString stringWithFormat:@"Time: %@",  timeStr];
    self.sunrise.text = [NSString stringWithFormat:@"Sunrise: %@",  sunriseStr];
    self.sunset.text = [NSString stringWithFormat:@"Sunset: %@",  sunsetStr];


    
}

@end
