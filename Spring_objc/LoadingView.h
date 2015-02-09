//
//  LoadingView.h
//  SpringApp
//
//  Created by ming on 15/2/9.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpringView.h"

@interface LoadingView : UIView

@property (weak, nonatomic) IBOutlet SpringView *indicatorView;

@end

@interface UIView (SpringLoading)

- (void)showLoading;
- (void)hideLoading;

@end
