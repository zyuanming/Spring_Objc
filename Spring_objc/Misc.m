//
//  Misc.m
//  SpringApp
//
//  Created by ming on 15/2/9.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "Misc.h"

@implementation Misc

+ (CGFloat)degreesToRadians:(CGFloat)degrees
{
    return degrees * (M_PI / 180.0);
}

+ (void)delay:(double)delay withAction:(void (^)(void))action
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), action);
}

@end
