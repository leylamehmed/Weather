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
    
    if (_weather.isCurrentLocation) {
        _selectedCityDict = _weather.currentCityDict;
        _selectedDayDict  = _weather.currentDayDict;
    }else{
        _selectedCityDict = _weather.selectedCityDict;
        _selectedDayDict  = _weather.selectedDayDict;
    }
    //Set title
    NSString *dateString = [_weather getDateString:_selectedDayDict[@"applicable_date"]];
    self.navigationItem.title = dateString;

    //setNavBar
    [self setNavigationBar];
    
    //set title
    [self setContent];
    
    // scrollview
    self.scrollView.contentSize= CGSizeMake(self.view.frame.size.width,self.view.frame.size.height);
    self.scrollView.contentInset = UIEdgeInsetsMake(0,0,0,0);
    self.scrollView.autoresizesSubviews = true;
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.scrollView setScrollEnabled:YES];
    [self.view addSubview:self.scrollView];
   
}

-(void) setContent {

    self.cityNameParentLoc.text = [NSString stringWithFormat:@"%@, %@",  _selectedCityDict[@"title"], _selectedCityDict[@"parent"][@"title"]];
    
    NSString *fromFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ";
    NSString *toFormat = @"HH:mm a";
    
    NSString *timeStr = [_weather convertDate:_selectedCityDict[@"time"] fromFormat:fromFormat toFormat:toFormat toTimeZone:_selectedCityDict[@"timezone"]];

    NSString *sunriseStr = [_weather convertDate:_selectedCityDict[@"sun_rise"] fromFormat:fromFormat toFormat:toFormat toTimeZone:_selectedCityDict[@"timezone"]];
    
    NSString *sunsetStr = [_weather convertDate:_selectedCityDict[@"sun_set"] fromFormat:fromFormat toFormat:toFormat toTimeZone:_selectedCityDict[@"timezone"]];
    
    
    NSString *degreeSymbol = [NSString stringWithFormat:@"%@", @"\u00B0"];

    NSString *theTempRounded = [NSString stringWithFormat:@"%@ %@C",  [NSNumber getRoundedNumber:[_selectedDayDict[@"the_temp"] floatValue] withMaximumFractionDigits:0], degreeSymbol];
    
    NSString *maxTempRounded = [NSString stringWithFormat:@"Max: %@ %@",  [NSNumber getRoundedNumber:[_selectedDayDict[@"max_temp"] floatValue] withMaximumFractionDigits:0], degreeSymbol];
    
    NSString *minTempRounded = [NSString stringWithFormat:@"Min: %@ %@",  [NSNumber getRoundedNumber:[_selectedDayDict[@"min_temp"] floatValue] withMaximumFractionDigits:0], degreeSymbol];
    
    NSString *windSpeedRounded = [NSString stringWithFormat:@"%@mph",  [NSNumber getRoundedNumber:[_selectedDayDict[@"wind_speed"] floatValue] withMaximumFractionDigits:0]];
    
    NSString *visibilityRounded = [NSString stringWithFormat:@"%@ miles",  [NSNumber getRoundedNumber:[_selectedDayDict[@"visibility"] floatValue] withMaximumFractionDigits:1]];
    
    self.time.text    = [NSString stringWithFormat:@"Time: %@",  timeStr];
    self.sunrise.text = [NSString stringWithFormat:@"Sunrise: %@",  sunriseStr];
    self.sunset.text  = [NSString stringWithFormat:@"Sunset: %@",  sunsetStr];
    self.theTemp.text  = theTempRounded;
    self.minMaxTemp.text = [NSString stringWithFormat:@"%@C / %@C",  minTempRounded, maxTempRounded];
    self.weatherStateName.text = _selectedDayDict[@"weather_state_name"];
    self.windSpeed.text = windSpeedRounded;
    self.humidity.text = [NSString stringWithFormat:@"%@%%",  _selectedDayDict[@"humidity"]];
    self.airPressure.text = [NSString stringWithFormat:@"%@mb",  _selectedDayDict[@"air_pressure"]];
    self.visibility.text = visibilityRounded;
    self.confidence.text = [NSString stringWithFormat:@"%@%%",  _selectedDayDict[@"predictability"]];;

    //set icon
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.metaweather.com/static/img/weather/png/%@.png",_selectedDayDict[@"weather_state_abbr"]]];
    [_weatherData getDataTaskForUrl:url withCompletionBlock:^(NSData * _Nonnull data, NSError * _Nonnull completionBlockError) {
        if (!completionBlockError) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *img = [UIImage imageWithImage:[UIImage imageWithData: data] convertToSize:CGSizeMake(200 ,200)];
                self.icon.image = img;
                [self.icon sizeToFit];
                
            });
            
        }else{
            NSLog(@"completionBlockError %@", completionBlockError.description);
        }
    }];
    
}

-(void) setNavigationBar {
    
    self.navigationController.navigationBar.barTintColor = [UIColor getProjectColorDarkBlue];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = false;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}
@end
