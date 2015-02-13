//
//  DesignableButton.m
//  SpringApp
//
//  Created by ming on 15/2/13.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "DesignableButton.h"

@implementation DesignableButton

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

- (void)setShadowColor:(UIColor *)shadowColor
{
    self.layer.shadowColor = shadowColor.CGColor;
}

- (void)setShadowRadius:(CGFloat)shadowRadius
{
    self.layer.shadowRadius = shadowRadius;
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity
{
    self.layer.shadowOpacity = shadowOpacity;
}

- (void)setShadowOffsetY:(CGFloat)shadowOffsetY
{
    self.layer.shadowOffset = CGSizeMake(self.layer.shadowOffset.width, shadowOffsetY);
}

@end
