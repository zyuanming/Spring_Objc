//
//  DesignableButton.h
//  SpringApp
//
//  Created by ming on 15/2/13.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "SpringButton.h"

@interface DesignableButton : SpringButton

@property (nonatomic, assign) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable UIColor *shadowColor;
@property (nonatomic, assign) IBInspectable CGFloat shadowRadius;
@property (nonatomic, assign) IBInspectable CGFloat shadowOpacity;
@property (nonatomic, assign) IBInspectable CGFloat shadowOffsetY;

@end
