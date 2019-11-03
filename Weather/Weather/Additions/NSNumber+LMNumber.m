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
   // float number = 1.9;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:0];
    NSNumber *roundedNumber = [formatter  stringFromNumber:[NSNumber numberWithFloat:floatNumber]];
    
    NSLog(@"LMDEBUGLMDEBUG %@",roundedNumber);

    return roundedNumber;
}

+ (NSString *) getRaudedValueString:(float) floatNumber {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:0];
    NSNumber *roundedNumber = [formatter  stringFromNumber:[NSNumber numberWithFloat:floatNumber]];
    
    NSLog(@"LMDEBUGLMDEBUG %@",roundedNumber);
    
    return [NSString stringWithFormat:@"%@", roundedNumber];
    
}

@end
