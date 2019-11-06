//
//  NSNumber+LMNumber.m
//  Weather
//
//  Created by LeyLa Mehmed on 3.11.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "NSNumber+LMNumber.h"

@implementation NSNumber (LMNumber)

+ (NSNumber *) getRoundedNumber:(float) floatNumber {

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:0];
    NSNumber *roundedNumber = [formatter  stringFromNumber:[NSNumber numberWithFloat:floatNumber]];
    
    return roundedNumber;
}

@end
