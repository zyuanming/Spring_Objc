//
//  SpringAnimation.h
//  SpringApp
//
//  Created by ming on 15/2/9.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SpringAnimation : NSObject

+ (void)springWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations;
+ (void)springEaseInWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations;
+ (void)springEaseOutWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations;
+ (void)springEaseInOutWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations;
+ (void)springLinearWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations;
+ (void)springWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay animations:(void (^)(void))animations;
+ (void)springWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^)(void))completion;


@end
