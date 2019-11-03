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
    NSLog(@"LMDEBUG CELL SELD1");

  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    //    CGRect rect = CGRectMake(5, 10, 300, 30);
        self.cityName = [UILabel customInit];
        self.weatherStateName = [UILabel customInit];
        self.maxTemp = [UILabel customInit];
        self.minTemp = [UILabel customInit];
        
    //   self.icon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 50, 50)];

        NSLog(@"LMDEBUG CELL SELD");
//        self.cityName.font = [UIFont fontWithName:@"Arial" size:15.0f];
//        self.cityName.textColor = [UIColor redColor];

        [self addSubview:self.cityName];
        [self addSubview:self.maxTemp];
        [self addSubview:self.minTemp];
        [self addSubview:self.weatherStateName];
        [self addSubview:self.icon];
       // [self addSubview:self.iconIMG];


    }
    return self;
}

@end
