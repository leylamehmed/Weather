//
//  LMCityTableViewCell.h
//  Weather
//
//  Created by LeyLa Mehmed on 29.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMCityTableViewCell : UITableViewCell

// now only showing one label, you can add more yourself
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

NS_ASSUME_NONNULL_END
