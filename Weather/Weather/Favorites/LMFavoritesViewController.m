//
//  LMFavoritesViewController.m
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMFavoritesViewController.h"
#import "LMWeatherData.h"
#import "LMWeather.h"
#import "LMDetailedForecastViewController.h"

@interface LMFavoritesViewController ()

@property LMWeather *weather;
@property LMWeatherData *weatherData;

@end

@implementation LMFavoritesViewController

+ (LMFavoritesViewController *)sharedInstance {
    static dispatch_once_t onceToken;
    static LMFavoritesViewController *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[LMFavoritesViewController alloc] init];
    });
    return instance;
}
- (instancetype) init
{
    self = [super init];
    if (self)
    {

    }
    return self;
}


-(void) getLocation {

    locationManager = [[CLLocationManager alloc] init];
    if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [locationManager requestAlwaysAuthorization];
    }
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    geocoder = [[CLGeocoder alloc] init];
    
    // fetching current location start from here
    [locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {

    [geocoder reverseGeocodeLocation:[locations lastObject] completionHandler:^(NSArray *placemarks, NSError *error) {
        
        CLLocation *currentLocation = [locations lastObject] ;
        
        if (currentLocation != nil) {
            
            NSString *lang = [NSString stringWithFormat:@"%.6f", currentLocation.coordinate.longitude];
            NSString *lat =  [NSString stringWithFormat:@"%.6f", currentLocation.coordinate.latitude];
            
            CLPlacemark *placemark = [placemarks lastObject];
            NSString *city = placemark.locality;
            
            //Get/set weather image
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.metaweather.com/api/location/search/?lattlong=%@,%@",lat,lang]];
            
            [[LMWeatherData sharedInstance] getDataTaskForUrl:url withCompletionBlock:^(NSData * _Nonnull data, NSError * _Nonnull completionBlockError) {
                if (!completionBlockError) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        NSError *e = nil;
                        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
                        
                        for (NSDictionary *citydict in dict) {
                            NSString *titlesString = [citydict valueForKey:@"title"];

                            if ([titlesString isEqual:city]) {
                                
                                //Get woeid for city
                                NSString *woeidString = [citydict valueForKey:@"woeid"];
                                
                                //Get data for this woeid
                                
                                [[LMWeatherData sharedInstance] fetchWoeidDataForWoeid:woeidString withCompletionBlock:^(NSMutableDictionary *woeidsDict, NSError *completionBlockError) {
                                    if (!completionBlockError) {
                                        
                                        //woeid data
                                        [[LMWeather sharedInstance] setCurrentCityDict:woeidsDict];
                                        [[LMWeather sharedInstance] setCurrentDayDict:woeidsDict[@"consolidated_weather"][0]];
                                    
                                    }
                                    else
                                    {
                                        NSLog(@"ERROR  %@ ", completionBlockError.description);
                                        
                                    }
                                    
                                }];
                                
                            }

                        }
                        
                        if (!dict) {
                            NSLog(@"Error parsing JSON: %@", e.description);
                        } else {
                          
                        }
                    });
                    
                }else{
                    NSLog(@"completionBlockError %@", completionBlockError.description);
                }
            }];
        }

        // stopping locationManager from fetching again
        [self->locationManager stopUpdatingLocation];
    }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"failed to fetch current location : %@", error);
}

@end
