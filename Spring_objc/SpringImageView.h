//
//  SpringImageView.h
//  SpringApp
//
//  Created by ming on 15/2/6.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Spring.h"

IB_DESIGNABLE
@interface SpringImageView : UIImageView<Springable>

@property (nonatomic, assign) IBInspectable BOOL autostart;
@property (nonatomic, assign) IBInspectable BOOL autohide;
@property (nonatomic, assign) IBInspectable AnimationStyle animation;
@property (nonatomic, assign) IBInspectable CGFloat force;
@property (nonatomic, assign) IBInspectable CGFloat delay;
@property (nonatomic, assign) IBInspectable CGFloat duration;
@property (nonatomic, assign) IBInspectable CGFloat damping;
@property (nonatomic, assign) IBInspectable CGFloat velocity;
@property (nonatomic, assign) IBInspectable CGFloat repeatCount;
@property (nonatomic, assign) IBInspectable CGFloat x;
@property (nonatomic, assign) IBInspectable CGFloat y;
@property (nonatomic, assign) IBInspectable CGFloat scaleX;
@property (nonatomic, assign) IBInspectable CGFloat scaleY;
@property (nonatomic, assign) IBInspectable CGFloat rotate;
@property (nonatomic, assign) IBInspectable CGFloat opacity;
@property (nonatomic, assign) IBInspectable BOOL animateFrom;
@property (nonatomic, assign) IBInspectable TimingFunctionSytle curve;
@property (nonatomic, assign, readonly) CALayer *layer;
@property (nonatomic, assign) IBInspectable CGAffineTransform transform;
@property (nonatomic, assign) IBInspectable CGFloat alpha;

- (void)animate;
- (void)animateNext:(void (^)(void))completion;
- (void)animateTo;
- (void)animateToNext:(void (^)(void))completion;

@end
