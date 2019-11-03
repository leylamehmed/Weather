//
//  UIImage+LMImage.h
//  Weather
//
//  Created by LeyLa Mehmed on 3.11.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LMImage)
+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
