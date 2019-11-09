//
//  LMFavoritesViewController.h
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMFavoritesViewController : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    
}

+ (LMFavoritesViewController *)sharedInstance;
- (instancetype) init;
-(void) getLocation;
@end

NS_ASSUME_NONNULL_END
