//
//  UIFont+LMSystemFontOverride.m
//  Weather
//
//  Created by LeyLa Mehmed on 31.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "UIFont+LMSystemFontOverride.h"

@implementation UIFont (LMSystemFontOverride)

+ (UIFont *)getProjectFont{
    
    return [UIFont fontWithName:@"Arial"  size:14.0f];
}

+ (UIFont *) setFontWithSize: (float) size {
    
    return [UIFont fontWithName:@"Arial" size:size];
}
@end
