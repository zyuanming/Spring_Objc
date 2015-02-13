//
//  DesignableImageView.m
//  SpringApp
//
//  Created by ming on 15/2/13.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "DesignableImageView.h"

@implementation DesignableImageView

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}
@end
