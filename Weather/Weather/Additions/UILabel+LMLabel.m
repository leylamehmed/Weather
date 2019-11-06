//
//  UILabel+LMLabel.m
//  Weather
//
//  Created by LeyLa Mehmed on 31.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "UILabel+LMLabel.h"
#import "UIColor+LMColor.h"
@implementation UILabel (LMLabel)

//+ (UILabel*) customInitWithCGRect : (CGRect) rect {
//
//    UILabel *label = [[UILabel alloc] initWithFrame:rect];
//    label.font = [UIFont fontWithName:@"Arial" size:14.0f];
//    label.textColor = [UIColor getProjectColorDarkBlue];
//    
//    return label;
//}
+ (UILabel*) customInit {
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:@"Arial" size:14.0f];
    label.textColor = [UIColor getProjectColorDarkBlue];
    
    return label;
}
@end

