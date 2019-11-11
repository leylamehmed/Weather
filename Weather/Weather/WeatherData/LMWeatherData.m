//
//  LMWeatherData.m
//  Weather
//
//  Created by LeyLa Mehmed on 30.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMWeatherData.h"
#import "AppDelegate.h"
#import "LMCitiesViewController.h"

#define API_URL @"https://www.metaweather.com/api"

@implementation LMWeatherData
@synthesize isDataFetched, isReload;

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
        
        Reachability *reachability = [Reachability reachabilityForInternetConnection];
        [reachability startNotifier];
        reachability.delegate = self;
        
        [reachability startNotifier];
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(reachabilityChanged:)
         name:kReachabilityChangedNotification
         object:nil];

        //set default IDs
        
        // 1. Sofia -  839722
        // 2. NY - 2459115
        // 3. Tokyo - 1118370
        self.woeids = [[NSMutableArray alloc] initWithObjects:@"839722",@"2459115",@"1118370",nil];
        self.woeidsDict = [[NSMutableDictionary alloc] init];
        self.woeidDatasArray = [[NSMutableArray alloc] init];
        self.isDataFetched = false;
        self.isReload = false;
    }
    return self;
}

-(void) fetchWoeidDataForWoeid:(NSString *)woeid withCompletionBlock:(void (^)(NSMutableDictionary * woeidsDict , NSError * completionBlockError)) completionBlock {
    
    BOOL network = [self currentNetworkStatus];
    
    if (network)
    {
             NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@/location/%@/", API_URL, woeid]];
             NSURLSession *session = [NSURLSession sharedSession];
             
             NSURLSessionDataTask *data = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                 
                 if (data!=nil) {
                     
                     self.woeidsDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error ];
                     //            [self.woeidDatasArray addObject:self.woeidsDict];
                     
                     completionBlock (self.woeidsDict, error);
                 } else {
                     
                     completionBlock (self.woeidsDict, error);
                     
                 }
             }];
             
             [data resume];

         }
         else
         {
             // No "Internet"

             [self presentAlertViewWithTitle:@"No Internet Connection" message:@"The application requires internet. Please connect and try again" andButtonTitle:@"OK"];
         
         }

}

-(void) getDataTaskForUrl:(NSURL *)url withCompletionBlock:(void (^)(NSData * data , NSError * completionBlockError)) completionBlock {
    
    BOOL network = [self currentNetworkStatus];

         if (network)
         {
             NSURLSession *session = [NSURLSession sharedSession];
             
             NSURLSessionDataTask *data = [session dataTaskWithURL:url completionHandler:^(NSData * data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                 
                 if (data!=nil) {
                     
                     completionBlock (data, error);
                     
                 } else {
                     
                     completionBlock (data, error);
                     
                 }
             }];
             [data resume];
             
         }
         else
         {
             // No "Internet"
             [self presentAlertViewWithTitle:@"No Internet Connection" message:@"The application requires internet connection. Please connect and try again." andButtonTitle:@"OK"];
         }
    
}

- (BOOL)currentNetworkStatus
{
    BOOL networkStatus = false;
    Reachability *reachability = [Reachability reachabilityForInternetConnection];

    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];

    if(remoteHostStatus == NotReachable) {
        NSLog(@"no");
        networkStatus = false;
    }
    else if (remoteHostStatus == ReachableViaWiFi) {
        NSLog(@"wifi");
        networkStatus = true;

    }
    else if (remoteHostStatus == ReachableViaWWAN) {
        NSLog(@"cell");
        networkStatus = true;

    }
    
    return networkStatus;
}

-(void) presentAlertViewWithTitle:(NSString* )title message:(NSString*)msg andButtonTitle:(NSString *)btnTitle {
    
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:msg
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* button = [UIAlertAction
                               actionWithTitle:btnTitle
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle no, thanks button
                               }];
    
    [alert addAction:button];
    UIViewController *currentTopVC = [self currentTopViewController];
    [currentTopVC presentViewController:alert animated:YES completion:nil];

}
- (UIViewController *)currentTopViewController
{
    UIViewController *topVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    while (topVC.presentedViewController)
    {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* currentReach = [note object];
    NetworkStatus internetStatus  =  [currentReach currentReachabilityStatus];

    NSParameterAssert([currentReach isKindOfClass:[Reachability class]]);
    if (internetStatus != NotReachable)
    {
        // handle UI as per your requirement
        [self restart];
    } else {
        [self presentAlertViewWithTitle:@"No Internet Connection" message:@"The application requires internet connection. Please connect and try again." andButtonTitle:@"OK"];
    }
    
}
-(void)restart
{

    [self setIsDataFetched:false];
    self.woeidDatasArray = [[NSMutableArray alloc] init];
    
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [appDelegate resetAppToFirstController];
  
}

- (void)callFunctionWithArg:(NSString *)arg {
    NSLog(@"callFunctionWithArg %@", arg) ;

}

@end
