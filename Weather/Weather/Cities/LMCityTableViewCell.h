//
//  LMCityTableViewCell.h
//  Weather
//
//  Created by LeyLa Mehmed on 29.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+LMLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LMCityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *weatherStateName;
@property (weak, nonatomic) IBOutlet UILabel *maxTemp;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *theTemp;

@end

NS_ASSUME_NONNULL_END
