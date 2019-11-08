//
//  LMWeather.h
//  Weather
//
//  Created by LeyLa Mehmed on 31.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMWeather : NSObject

+ (LMWeather *)sharedInstance;
- (instancetype) init;

@property (nonatomic, strong) NSDictionary *selectedCityDict;
@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSDictionary *selectedDayDict;

@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *parentLocationTitle;
@property (nonatomic, strong) NSString *maxTemp;
@property (nonatomic, strong) NSString *minTemp;
@property (nonatomic, strong) NSString *theTemp;
@property (nonatomic, strong) NSString *visibility;
@property (nonatomic, strong) NSString *weatherStateName;
@property (nonatomic, strong) NSString *weatherStateAbbr;
@property (nonatomic, strong) NSString *sunRise;
@property (nonatomic, strong) NSString *sunSet;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *timeZoneCity;
@property (nonatomic, strong) NSString *airPressure;
@property (nonatomic, strong) NSString *applicableDate;
@property (nonatomic, strong) NSString *created;
@property (nonatomic, strong) NSString *humidity;
@property (nonatomic, strong) NSString *windDirection;
@property (nonatomic, strong) NSString *windDirectionCompass;
@property (nonatomic, strong) NSString *windSpeed;

-(void) dataProcessing:(int)indexPathRow;
-(NSString *)getDateString:(NSString*) dateStr;
-(NSString *)convertDate:(NSString *)strDate fromFormat:(NSString *)strFromFormat toFormat:(NSString *)strToFormat toTimeZone:(NSString*) timezoneName;
-(NSString *)convertDateToString:(NSDate *)strDate toFormat:(NSString *)strToFormat toTimeZone:(NSString*) timezoneName;
-(NSDate *)convertStringToDate:(NSString *)strDate fromFormat:(NSString *)strFromFormat;

@end

NS_ASSUME_NONNULL_END
