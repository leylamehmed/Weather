//
//  LMWeather.m
//  Weather
//
//  Created by LeyLa Mehmed on 31.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMWeather.h"

@implementation LMWeather

@synthesize cityName;

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
        self.cityName = cityName;
    }
    return self;
}

- (void) addProgrees {
    
}

@end
