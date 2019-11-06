//
//  LMDailyForecastViewController.h
//  Weather
//
//  Created by LeyLa Mehmed on 4.11.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMDailyForecastViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}

@property NSArray *consolidatedWeatherArr;

@end

NS_ASSUME_NONNULL_END
