//
//  LMCityTableViewCell.m
//  Weather
//
//  Created by LeyLa Mehmed on 29.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMCityTableViewCell.h"
#import "UILabel+LMLabel.h"

@implementation LMCityTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cityName = [UILabel customInit];
        self.weatherStateName = [UILabel customInit];
        self.maxTemp = [UILabel customInit];
        self.minTemp = [UILabel customInit];
        
        [self addSubview:self.cityName];
        [self addSubview:self.maxTemp];
        [self addSubview:self.minTemp];
        [self addSubview:self.weatherStateName];
        [self addSubview:self.icon];

    }
    return self;
}

@end
