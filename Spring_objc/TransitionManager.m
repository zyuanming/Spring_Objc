//
//  TransitionManager.m
//  SpringApp
//
//  Created by ming on 15/2/9.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "TransitionManager.h"
#import "SpringAnimation.h"
#import "Misc.h"

#define AnimationDuration 0.3

@implementation TransitionManager


#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    _isPresenting = YES;
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    _isPresenting = NO;
    return self;
}


#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return AnimationDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *container = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    if (_isPresenting) {
        toView.frame = container.bounds;
        toView.transform = CGAffineTransformMakeTranslation(0, container.frame.size.height);
        [container addSubview:fromView];
        [container addSubview:toView];
        [SpringAnimation springEaseInOutWithDuration:AnimationDuration animations:^{
            fromView.transform = CGAffineTransformMakeScale(0.8, 0.8);
            fromView.alpha = 0.5;
            toView.transform = CGAffineTransformIdentity;
        }];
    } else {
        // 1. Rotating will change the bounds
        // 2. we have to properly reset toView
        // to the actual container's bounds, at
        // the same time take consideration of
        // previous transformation when presenting
        
        CGAffineTransform transform = toView.transform;
        toView.transform = CGAffineTransformIdentity;
        toView.frame = container.bounds;
        toView.transform = transform;
        
        [container addSubview:toView];
        [container addSubview:fromView];
        
        [SpringAnimation springEaseInOutWithDuration:AnimationDuration animations:^{
            fromView.transform = CGAffineTransformMakeTranslation(0, fromView.frame.size.height);
            toView.alpha = 1.0;
        }];
    }
    
    [Misc delay:AnimationDuration withAction:^{
        [transitionContext completeTransition:YES];
    }];
    
}

@end
