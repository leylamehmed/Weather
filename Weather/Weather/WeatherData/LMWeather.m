//
//  LMWeather.m
//  Weather
//
//  Created by LeyLa Mehmed on 31.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMWeather.h"
#import "NSNumber+LMNumber.h"

@implementation LMWeather

@synthesize cityName, parentLocationTitle, maxTemp, minTemp, theTemp, visibility, weatherStateName, weatherStateAbbr, sunRise, sunSet, time, timeZoneCity, airPressure, applicableDate, created, humidity, windDirection, windDirectionCompass, windSpeed;

@synthesize selectedCityDict, selectedDayDict;
;
@synthesize dict;

+ (LMWeather *)sharedInstance {
    static dispatch_once_t onceToken;
    static LMWeather *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[LMWeather alloc] init];
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


-(void) dataProcessing:(int) indexPathRow {
    
    cityName = dict[@"title"];
    parentLocationTitle = dict[@"parent"][@"title"];
    sunSet = dict[@"sun_set"];
    sunRise = dict[@"sun_rise"];
    time = [NSString stringWithFormat:@"%@", dict[@"sun_rise"]];
    timeZoneCity = dict[@"timezone"];
    
    NSString *maxTempStr = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"max_temp"]];

    maxTemp = [NSString stringWithFormat:@"%@", [NSNumber getRoundedNumber:[maxTempStr floatValue]]];
    
    NSString *minTempStr = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"min_temp"]];
    
    minTemp = [NSString stringWithFormat:@"%@", [NSNumber getRoundedNumber:[minTempStr floatValue]]];
    
    NSString *theTempStr = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"the_temp"]];
    
    theTemp = [NSString stringWithFormat:@"%@", [NSNumber getRoundedNumber:[theTempStr floatValue]]];
    
    visibility = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"visibility"]];
    
    weatherStateName = [NSString stringWithFormat: @"%@", dict[@"consolidated_weather"][indexPathRow][@"weather_state_name"]];
    
    weatherStateAbbr = [NSString stringWithFormat: @"%@", dict[@"consolidated_weather"][indexPathRow][@"weather_state_abbr"]];

    airPressure =  [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"air_pressure"]];

    applicableDate = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"applicable_date"]];
    
    created = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"created"]];
    
    humidity = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"humidity"]];
    
    windDirection  = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"wind_direction"]];
    
    windDirectionCompass  = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"wind_direction_compass"]];
    
    NSString *windSpeedStr = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][indexPathRow][@"wind_speed"]];
    
    windSpeed = [NSString stringWithFormat:@"%@", [NSNumber getRoundedNumber:[windSpeedStr floatValue]]];
    
}



-(NSString *)getDateString:(NSString*) dateStr {
//    NSString *dateString = dateStr
    NSString* finalDateString;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [format dateFromString:dateStr];
    BOOL today = [[NSCalendar currentCalendar] isDateInToday:date];
    BOOL tomorrow = [[NSCalendar currentCalendar] isDateInTomorrow:date];

    if (today) {
        finalDateString = @"Today";
    } else if (tomorrow) {
        finalDateString = @"Tomorrow";
    } else {
        [format setDateFormat:@"dd MMM yyyy"];
        finalDateString = [format stringFromDate:date];
    }
    
    
    return finalDateString;
}




@end
