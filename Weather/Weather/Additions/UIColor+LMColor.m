//
//  UIColor+LMColor.m
//  Weather
//
//  Created by LeyLa Mehmed on 31.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "UIColor+LMColor.h"

@implementation UIColor (LMColor)

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    
    if (!hexString) {
        return nil;
    }
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

+ (UIColor *) getProjectColor {
    //custom blue color
    UIColor *projectColor = [self colorFromHexString:@"#106cce"];
    return projectColor;
}


@end
