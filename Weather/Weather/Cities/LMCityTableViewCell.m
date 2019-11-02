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
        self.updatedTime = [UILabel customInit];
        self.maxTemp = [UILabel customInit];
        self.minTemp = [UILabel customInit];
        NSLog(@"LMDEBUG CELL SELD");
//        self.cityName.font = [UIFont fontWithName:@"Arial" size:15.0f];
//        self.cityName.textColor = [UIColor redColor];

        [self addSubview:self.cityName];
    }
    return self;
}

@end
