//
//  TransitionZoom.m
//  SpringApp
//
//  Created by ming on 15/2/9.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "TransitionZoom.h"
#import "SpringAnimation.h"
#import "Misc.h"

#define AnimationDuration 0.4

@implementation TransitionZoom

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
        [container addSubview:fromView];
        [container addSubview:toView];
        
        toView.alpha = 0.0;
        toView.transform = CGAffineTransformMakeScale(2.0, 2.0);
        [SpringAnimation springEaseInOutWithDuration:AnimationDuration animations:^{
            fromView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            fromView.alpha = 0;
            toView.transform = CGAffineTransformIdentity;
            toView.alpha = 1.0;
        }];
    } else {
        [container addSubview:toView];
        [container addSubview:fromView];
        
        [SpringAnimation springEaseInOutWithDuration:AnimationDuration animations:^{
            fromView.transform = CGAffineTransformMakeScale(2.0, 2.0);
            fromView.alpha = 0.0;
            toView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            toView.alpha = 1.0;
        }];
    }
    
    [Misc delay:AnimationDuration withAction:^{
        [transitionContext completeTransition:YES];
    }];
    
}

@end
