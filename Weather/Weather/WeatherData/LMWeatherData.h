//
//  LMWeatherData.h
//  Weather
//
//  Created by LeyLa Mehmed on 30.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMWeatherData : NSObject

+ (LMWeatherData *)sharedInstance;
- (instancetype) init;

@property (strong, nonatomic) NSMutableArray *woeids;
@property (strong, nonatomic) NSMutableDictionary *woeidsDict;
@property (strong, nonatomic) NSMutableArray *woeidDatasArray;

-(void) fetchWoeidDataForWoeid:(NSString *)woeid withCompletionBlock:(void (^)(NSMutableDictionary * _Nonnull woeidsDict , NSError * _Nonnull completionBlockError)) completionBlock;
@end

NS_ASSUME_NONNULL_END
