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

@property (nonatomic, strong) UILabel *cityName;// name of city

//@property (nonatomic, strong) NSString *cityName; // name of city
//@property (nonatomic, strong) NSString *imageFile; // image filename of weather
//

@end

NS_ASSUME_NONNULL_END