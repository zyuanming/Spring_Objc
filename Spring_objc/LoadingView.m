//
//  LoadingView.m
//  SpringApp
//
//  Created by ming on 15/2/9.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "LoadingView.h"
#import "Misc.h"

@implementation LoadingView

- (void)awakeFromNib
{
    CABasicAnimation *animation = [[CABasicAnimation alloc]init];
    animation.keyPath = @"transform.rotation.z";
    animation.fromValue = @([Misc degreesToRadians:0]);
    animation.toValue = @([Misc degreesToRadians:360]);
    animation.duration = 0.9;
    animation.repeatCount = HUGE;
    [_indicatorView.layer addAnimation:animation forKey:@""];
}

+ (UIView *)designCodeLoadingView
{
    return [[NSBundle mainBundle] loadNibNamed:@"LoadingView" owner:self options:nil][0];
}

@end


@implementation UIView (SpringLoading)

#define LoadingViewConstants 1000

- (void)showLoading
{
    if ([self viewWithTag:LoadingViewConstants]) {
        return;
    }
    
    UIView *loadingXibView = [LoadingView designCodeLoadingView];
    loadingXibView.frame = self.bounds;
    loadingXibView.tag = LoadingViewConstants;
    [self addSubview:loadingXibView];
    loadingXibView.alpha = 0.0;
    
    [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:0 animations:^{
        
    } completion:nil];
}

- (void)hideLoading
{
    UIView *loadingXibView = [self viewWithTag:LoadingViewConstants];
    if (loadingXibView) {
        loadingXibView.alpha = 1.0;
        
        [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:0 animations:^{
            loadingXibView.alpha = 0.0;
            loadingXibView.transform = CGAffineTransformMakeScale(3, 3);
        } completion:^(BOOL finished) {
            [loadingXibView removeFromSuperview];
        }];
    }
}

@end

