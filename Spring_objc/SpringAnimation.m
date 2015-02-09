//
//  SpringAnimation.m
//  SpringApp
//
//  Created by ming on 15/2/9.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "SpringAnimation.h"

@implementation SpringAnimation

+ (void)springWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations
{
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:0 animations:^{
        animations();
    } completion:nil];
}

+ (void)springEaseInWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations
{
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animations();
    } completion:nil];
}

+ (void)springEaseOutWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations
{
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        animations();
    } completion:nil];
}

+ (void)springEaseInOutWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations
{
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        animations();
    } completion:nil];
}

+ (void)springLinearWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations
{
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        animations();
    } completion:nil];
}
+ (void)springWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay animations:(void (^)(void))animations
{
    [UIView animateWithDuration:duration delay:delay options:0 animations:^{
        animations();
    } completion:nil];
}

+ (void)springWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^)(void))completion
{
    [UIView animateWithDuration:duration delay:0.0 options:0 animations:^{
        animations();
    } completion:^(BOOL finished) {
        completion();
    }];
}

@end
