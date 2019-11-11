//
//  LMWeatherData.h
//  Weather
//
//  Created by LeyLa Mehmed on 30.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

@class Reachability;
#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"

NS_ASSUME_NONNULL_BEGIN

@interface LMWeatherData : NSObject  <ReachabilityDelegate>

@property(strong,nonatomic)Reachability *reachability;
+ (LMWeatherData *)sharedInstance;
- (instancetype) init;
@property (strong, nonatomic) NSMutableArray *woeids;
@property (strong, nonatomic) NSMutableDictionary *woeidsDict;
@property (strong, nonatomic) NSMutableArray *woeidDatasArray;
@property (nonatomic) BOOL isDataFetched;
@property (nonatomic) BOOL isReload;

-(void) fetchWoeidDataForWoeid:(NSString *)woeid withCompletionBlock:(void (^)(NSMutableDictionary * _Nonnull woeidsDict , NSError * _Nonnull completionBlockError)) completionBlock;

-(void) getDataTaskForUrl:(NSURL *)url withCompletionBlock:(void (^)(NSData * data , NSError * completionBlockError)) completionBlock;
@end

NS_ASSUME_NONNULL_END
