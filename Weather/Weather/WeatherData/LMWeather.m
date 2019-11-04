//
//  LMWeather.m
//  Weather
//
//  Created by LeyLa Mehmed on 31.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMWeather.h"

@implementation LMWeather

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

- (void) addProgrees {
    
}

@end
