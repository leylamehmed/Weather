//
//  LMDailyForecastViewController.m
//  Weather
//
//  Created by LeyLa Mehmed on 4.11.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMDailyForecastViewController.h"
#import "LMWeather.h"
#import "LMDailyForecastCollectionViewCell.h"
#import "UIColor+LMColor.h"
#import "NSNumber+LMNumber.h"
#import "LMWeatherData.h"
#import "UIImage+LMImage.h"
#import "LMDetailedForecastViewController.h"

@interface LMDailyForecastViewController ()
    @property LMWeather *weather;
    @property LMWeatherData *weatherData;
@end

@implementation LMDailyForecastViewController

static NSString * const reuseIdentifier = @"dailyForecastCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    _weather = [LMWeather sharedInstance];
    _weatherData = [LMWeatherData sharedInstance];

    self.navigationItem.title = _weather.selectedCityDict[@"title"];

    //Add custom views
    
    [self addCollectionView];
    
    _consolidatedWeatherArr = [NSArray arrayWithArray:_weather.selectedCityDict[@"consolidated_weather"]];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _consolidatedWeatherArr.count;
}

- (LMDailyForecastCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LMDailyForecastCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //set cell border
    CGFloat borderWidth = 1.0f;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.layer.borderWidth = borderWidth;


    NSDictionary *dict = [_consolidatedWeatherArr objectAtIndexedSubscript:indexPath.row];
   
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.metaweather.com/static/img/weather/png/64/%@.png",dict[@"weather_state_abbr"]]];
    [_weatherData getDataTaskForUrl:url withCompletionBlock:^(NSData * _Nonnull data, NSError * _Nonnull completionBlockError) {
        if (!completionBlockError) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *img = [UIImage imageWithImage:[UIImage imageWithData: data] convertToSize:CGSizeMake(64, 64)];
                cell.icon.image = img;
                [cell.icon sizeToFit];
                
            });
            
        }else{
            NSLog(@"completionBlockError %@", completionBlockError.description);
        }
    }];
    
    NSString *degreeSymbol = [NSString stringWithFormat:@"%@", @"\u00B0"];
    
    NSString *maxTempRounded = [NSString stringWithFormat:@"Max: %@ %@C",  [NSNumber getRoundedNumber:[dict[@"max_temp"] floatValue]], degreeSymbol];
    
    NSString *minTempRounded = [NSString stringWithFormat:@"Min: %@ %@C",  [NSNumber getRoundedNumber:[dict[@"min_temp"] floatValue]], degreeSymbol];
    
    NSString *theTempRounded = [NSString stringWithFormat:@"%@ %@C",  [NSNumber getRoundedNumber:[dict[@"the_temp"] floatValue]], degreeSymbol];
    
     NSString *windSpeedRounded = [NSString stringWithFormat:@"Wind Speed: %@mph ",  [NSNumber getRoundedNumber:[dict[@"wind_speed"] floatValue]]];

   NSString *dateString = [_weather getDateString:dict[@"applicable_date"]];
    cell.applicableDate.text = dateString;
    
    cell.minTemp.text = [NSString stringWithFormat:@"%@ / %@",  maxTempRounded, minTempRounded];
    cell.theTemp.text = theTempRounded;
    cell.weatherStateName.text = dict[@"weather_state_name"];
    cell.windSpeed.text = windSpeedRounded;


    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"Selected  %ld", (long)indexPath.row);
    _weather.selectedDayDict = [_consolidatedWeatherArr objectAtIndexedSubscript:indexPath.row];
    
    LMDetailedForecastViewController *detailedForecastVC = [[LMDetailedForecastViewController alloc]
                                           initWithNibName:@"LMDetailedForecastViewController" bundle:nil];
    
    [self.navigationController pushViewController:detailedForecastVC animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//this method overrides the changes you have made to inc or dec the size of cell using storyboard.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:   (UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(180, 285);
}

- (void) addCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [layout setSectionInset:UIEdgeInsetsMake(30, 20, 30, 20)];
    
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"LMDailyForecastCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:_collectionView];
    
}

@end
