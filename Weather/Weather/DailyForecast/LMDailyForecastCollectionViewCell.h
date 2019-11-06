//
//  LMDailyForecastCollectionViewCell.h
//  Weather
//
//  Created by LeyLa Mehmed on 5.11.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMDailyForecastCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *applicableDate;
@property (weak, nonatomic) IBOutlet UILabel *weatherStateName;
@property (weak, nonatomic) IBOutlet UILabel *minTemp;
@property (weak, nonatomic) IBOutlet UILabel *windSpeed;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *theTemp;

@end

NS_ASSUME_NONNULL_END
