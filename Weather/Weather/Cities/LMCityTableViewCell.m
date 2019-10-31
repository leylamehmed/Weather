//
//  LMCityTableViewCell.m
//  Weather
//
//  Created by LeyLa Mehmed on 29.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMCityTableViewCell.h"

@implementation LMCityTableViewCell

@synthesize cityName = _cityName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = CGRectMake(5, 10, 300, 30);
        self.cityName = [UILabel customInitWithCGRect:rect];
//        self.cityName.font = [UIFont fontWithName:@"Arial" size:15.0f];
//        self.cityName.textColor = [UIColor redColor];

        [self addSubview:self.cityName];
    }
    return self;
}

@end
