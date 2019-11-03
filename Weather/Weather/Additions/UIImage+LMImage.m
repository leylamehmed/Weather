//
//  UIImage+LMImage.m
//  Weather
//
//  Created by LeyLa Mehmed on 3.11.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "UIImage+LMImage.h"

@implementation UIImage (LMImage)

+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

@end
