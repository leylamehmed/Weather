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
@property (nonatomic, strong) NSString *cityName; // name of city
//@property (nonatomic, strong) UIImage *imageFile; // image filename of weather
//
//


@end

NS_ASSUME_NONNULL_END
