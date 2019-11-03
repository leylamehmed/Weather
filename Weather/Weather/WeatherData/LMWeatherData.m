//
//  LMWeatherData.m
//  Weather
//
//  Created by LeyLa Mehmed on 30.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMWeatherData.h"
#define API_URL @"https://www.metaweather.com/api"

@implementation LMWeatherData
@synthesize isDataFetched;
+ (LMWeatherData *)sharedInstance {
    static dispatch_once_t onceToken;
    static LMWeatherData *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[LMWeatherData alloc] init];
    });
    return instance;
}
- (instancetype) init
{
    self = [super init];
    if (self)
    {
        //set default IDs
        
        // 1. Sofia -  839722
        // 2. NY - 2459115
        // 3. Tokyo - 1118370
        self.woeids = [[NSMutableArray alloc] initWithObjects:@"839722",@"2459115",@"1118370",nil];
        self.woeidsDict = [[NSMutableDictionary alloc] init];
        self.woeidDatasArray = [[NSMutableArray alloc] init];
        self.isDataFetched = false;
    }
    return self;
}

-(void) fetchWoeidDataForWoeid:(NSString *)woeid withCompletionBlock:(void (^)(NSMutableDictionary * woeidsDict , NSError * completionBlockError)) completionBlock {
    
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@/location/%@/", API_URL, woeid]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *data = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data!=nil) {
            
            self.woeidsDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error ];
            [self.woeidDatasArray addObject:self.woeidsDict];
            
            completionBlock (self.woeidsDict, error);
        } else {
            
            completionBlock (self.woeidsDict, error);
            
        }
    }];
    
    [data resume];
    
}

-(void) getDataTaskForUrl:(NSURL *)url withCompletionBlock:(void (^)(NSData * data , NSError * completionBlockError)) completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *data = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data!=nil) {
            
                completionBlock (data, error);
//            NSLog(@"image: %@",  [UIImage imageWithData: data]);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"LMDEBUG imageData 1 %@", [UIImage imageWithData: data]);
//                UIImage *img = [UIImage imageWithImage:[UIImage imageWithData: data] convertToSize:CGSizeMake(50, 50)];
//                cell.icon.image = img;
//                [cell.icon sizeToFit];
//
//            });
            
        } else {
            
            completionBlock (data, error);

        }
    }];
    [data resume];
    

}

@end
