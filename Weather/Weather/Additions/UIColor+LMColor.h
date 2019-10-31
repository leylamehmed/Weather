//
//  UIColor+LMColor.h
//  Weather
//
//  Created by LeyLa Mehmed on 31.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LMColor)
+ (UIColor *) colorFromHexString:(NSString *)hexString;
+ (UIColor *) getProjectColor;
@end

NS_ASSUME_NONNULL_END
