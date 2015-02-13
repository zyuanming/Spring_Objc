//
//  DesignableImageView.h
//  SpringApp
//
//  Created by ming on 15/2/13.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "SpringImageView.h"

@interface DesignableImageView : SpringImageView

@property (nonatomic, assign) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@end
