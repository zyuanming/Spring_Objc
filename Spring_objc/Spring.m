//
//  Spring.m
//  SpringApp
//
//  Created by ming on 15/2/6.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "Spring.h"

@interface Spring()

@property (nonatomic, weak) id<Springable> springAble;

@end

@implementation Spring

- (instancetype)initWith:(id<Springable>) springAble
{
    self = [super init];
    if (self) {
        self.springAble = springAble;
    }
    return self;
}

- (void)animatePreset
{
    switch ([self.springAble animation]) {
        case NoneStyle:
            return;
            break;
        case SlideLeft:
            self.springAble.x = 300 * self.springAble.force;
            break;
        case SlideRight:
            self.springAble.x = -300 * self.springAble.force;
            break;
        case SlideDown:
            self.springAble.y = -300 * self.springAble.force;
            break;
        case SlideUp:
            self.springAble.y = 300 * self.springAble.force;
            break;
        case SqueezeLeft:
            self.springAble.x = 300;
            self.springAble.scaleX = 3 * self.springAble.force;
            break;
        case SqueezeRight:
            self.springAble.x = -300;
            self.springAble.scaleX = 3 * self.springAble.force;
            break;
        case SqueezeDown:
            self.springAble.y = -300;
            self.springAble.scaleY = 3 * self.springAble.force;
            break;
        case SqueezeUp:
            self.springAble.y = 300;
            self.springAble.scaleY = 3 * self.springAble.force;
            break;
        case FadeIn:
            self.springAble.opacity = 0;
            break;
        case FadeOut:
            self.springAble.animateFrom = NO;
            self.springAble.opacity = 0;
            break;
        case FadeOutIn:
        {
            CABasicAnimation *basicAnimation = [[CABasicAnimation alloc]init];
            basicAnimation.keyPath = @"opacity";
            basicAnimation.fromValue = @1;
            basicAnimation.toValue = @0;
            basicAnimation.timingFunction = [self getTimingFunction:self.springAble.curve];
            basicAnimation.duration = (CFTimeInterval)self.springAble.duration;
            basicAnimation.beginTime = CACurrentMediaTime() + (CFTimeInterval)self.springAble.delay;
            basicAnimation.autoreverses = YES;
            [self.springAble.layer addAnimation:basicAnimation forKey:@"fade"];
        }
            break;
        case FadeInLeft:
            self.springAble.opacity = 0;
            self.springAble.x = 300 * self.springAble.force;
            break;
        case FadeInRight:
            self.springAble.x = -300 * self.springAble.force;
            self.springAble.opacity = 0;
            break;
        case FadeInDown:
            self.springAble.y = -300 * self.springAble.force;
            self.springAble.opacity = 0;
            break;
        case ZoomIn:
            self.springAble.opacity = 0;
            self.springAble.scaleX = 2 * self.springAble.force;
            self.springAble.scaleY = 2 * self.springAble.force;
            break;
        case ZoomOut:
            self.springAble.animateFrom = NO;
            self.springAble.opacity = 0;
            self.springAble.scaleX = 2 * self.springAble.force;
            self.springAble.scaleY = 2 * self.springAble.force;
            break;
        case Fall:
            self.springAble.animateFrom = NO;
            self.springAble.rotate = 15 * M_PI / 180.0;
            self.springAble.y = 600 * self.springAble.force;
            break;
        case Shake:
        {
            CAKeyframeAnimation *keyAnimation = [[CAKeyframeAnimation alloc]init];
            keyAnimation.keyPath = @"position.x";
            keyAnimation.values = @[@0, @(30.0 * self.springAble.force), @(-30.0 * self.springAble.force), @(30.0 * self.springAble.force), @0];
            keyAnimation.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
            keyAnimation.timingFunction = [self getTimingFunction:self.springAble.curve];
            keyAnimation.duration = (CFTimeInterval)self.springAble.duration;
            keyAnimation.additive = YES;
            keyAnimation.repeatCount = self.springAble.repeatCount;
            keyAnimation.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.delay);
            [self.springAble.layer addAnimation:keyAnimation forKey:@"shake"];
        }
            break;
        case Pop:
        {
            CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc]init];
            animation.keyPath = @"transform.scale";
            animation.values = @[@0, @(0.2 * self.springAble.force), @(-0.2 * self.springAble.force), @(0.2 * self.springAble.force), @0];
            animation.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
            animation.timingFunction = [self getTimingFunction:self.springAble.curve];
            animation.duration = (CFTimeInterval)(self.springAble.duration);
            animation.additive = YES;
            animation.repeatCount = self.springAble.repeatCount;
            animation.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.delay);
            [self.springAble.layer addAnimation:animation forKey:@"pop"];
        }
            break;
        case FlipX:
        {
            self.springAble.rotate = 0;
            self.springAble.scaleX = 1;
            self.springAble.scaleY = 1;
            CATransform3D perspective = CATransform3DIdentity;
            perspective.m34 = -1.0 / self.springAble.layer.frame.size.width / 2.0;
            
            CABasicAnimation *basicAnimation = [[CABasicAnimation alloc]init];
            basicAnimation.keyPath = @"transform";
            basicAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 0)];
            basicAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DConcat(perspective, CATransform3DMakeRotation(M_PI, 0, 1, 0))];
            basicAnimation.duration = (CFTimeInterval)(self.springAble.duration);
            basicAnimation.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.delay);
            basicAnimation.timingFunction = [self getTimingFunction:self.springAble.curve];
            [self.springAble.layer addAnimation:basicAnimation forKey:@"3d"];
        }
            break;
        case FlipY:
        {
            CATransform3D perspective = CATransform3DIdentity;
            perspective.m34 = -1.0 / self.springAble.layer.frame.size.width / 2.0;
            
            CABasicAnimation *basicAnimation = [[CABasicAnimation alloc]init];
            basicAnimation.keyPath = @"transform";
            basicAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 0)];
            basicAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DConcat(perspective, CATransform3DMakeRotation(M_PI, 1, 0, 0))];
            basicAnimation.duration = (CFTimeInterval)(self.springAble.duration);
            basicAnimation.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.delay);
            basicAnimation.timingFunction = [self getTimingFunction:self.springAble.curve];
            [self.springAble.layer addAnimation:basicAnimation forKey:@"3d"];
        }
            break;
        case Morph:
        {
            CAKeyframeAnimation *morphX = [[CAKeyframeAnimation alloc]init];
            morphX.keyPath = @"transform.scale.x";
            morphX.values = @[@1, @(1.3 * self.springAble.force), @0.7, @(1.3 * self.springAble.force), @1];
            morphX.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
            morphX.timingFunction = [self getTimingFunction:self.springAble.curve];
            morphX.duration = (CFTimeInterval)(self.springAble.duration);
            morphX.repeatCount = self.springAble.repeatCount;
            morphX.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.duration);
            [self.springAble.layer addAnimation:morphX forKey:@"morphX"];
            
            CAKeyframeAnimation *morphY = [[CAKeyframeAnimation alloc]init];
            morphY.keyPath = @"transform.scale.y";
            morphY.values = @[@1, @0.7 , @(1.3 * self.springAble.force), @0.7, @1];
            morphY.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
            morphY.timingFunction = [self getTimingFunction:self.springAble.curve];
            morphY.duration = (CFTimeInterval)(self.springAble.duration);
            morphY.repeatCount = self.springAble.repeatCount;
            morphY.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.duration);
            [self.springAble.layer addAnimation:morphY forKey:@"morphY"];
        }
            break;
        case Squeeze:
        {
            CAKeyframeAnimation *morphX = [[CAKeyframeAnimation alloc]init];
            morphX.keyPath = @"transform.scale.x";
            morphX.values = @[@1, @(1.5 * self.springAble.force), @0.5, @(1.5 * self.springAble.force), @1];
            morphX.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
            morphX.timingFunction = [self getTimingFunction:self.springAble.curve];
            morphX.duration = (CFTimeInterval)(self.springAble.duration);
            morphX.repeatCount = self.springAble.repeatCount;
            morphX.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.duration);
            [self.springAble.layer addAnimation:morphX forKey:@"morphX"];
            
            CAKeyframeAnimation *morphY = [[CAKeyframeAnimation alloc]init];
            morphY.keyPath = @"transform.scale.y";
            morphY.values = @[@1, @0.5 , @1, @0.5, @1];
            morphY.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
            morphY.timingFunction = [self getTimingFunction:self.springAble.curve];
            morphY.duration = (CFTimeInterval)(self.springAble.duration);
            morphY.repeatCount = self.springAble.repeatCount;
            morphY.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.duration);
            [self.springAble.layer addAnimation:morphY forKey:@"morphY"];
        }
            break;
        case Flash:
        {
            CABasicAnimation *basicAnimation = [[CABasicAnimation alloc]init];
            basicAnimation.keyPath = @"opacity";
            basicAnimation.fromValue = @1;
            basicAnimation.toValue = @0;
            basicAnimation.duration = (CFTimeInterval)(self.springAble.duration);
            basicAnimation.repeatCount = self.springAble.repeatCount * 2.0;
            basicAnimation.autoreverses = YES;
            basicAnimation.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.delay);
            [self.springAble.layer addAnimation:basicAnimation forKey:@"flash"];
        }
            break;
        case Wobble:
        {
            CAKeyframeAnimation *rotateAnimation = [[CAKeyframeAnimation alloc]init];
            rotateAnimation.keyPath = @"transform.rotation";
            rotateAnimation.values = @[@0, @(0.3*self.springAble.force), @(-0.3*self.springAble.force), @(0.3*self.springAble.force), @0];
            rotateAnimation.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
            rotateAnimation.duration = (CFTimeInterval)(self.springAble.duration);
            rotateAnimation.additive = YES;
            rotateAnimation.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.delay);
            [self.springAble.layer addAnimation:rotateAnimation forKey:@"wobble"];
            
            CAKeyframeAnimation *xAnimation = [[CAKeyframeAnimation alloc]init];
            xAnimation.keyPath = @"position.x";
            xAnimation.values = @[@0, @(30*self.springAble.force), @(-30*self.springAble.force), @(30*self.springAble.force), @0];
            xAnimation.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
            xAnimation.timingFunction = [self getTimingFunction:self.springAble.curve];
            xAnimation.duration = (CFTimeInterval)(self.springAble.duration);
            xAnimation.additive = YES;
            xAnimation.repeatCount = self.springAble.repeatCount;
            xAnimation.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.delay);
            [self.springAble.layer addAnimation:xAnimation forKey:@"x"];
        }
            break;
        case Swing:
        {
            CAKeyframeAnimation *keyframeAnimation = [[CAKeyframeAnimation alloc]init];
            keyframeAnimation.keyPath = @"transform.rotation";
            keyframeAnimation.values = @[@0, @(0.3*self.springAble.force), @(-0.3*self.springAble.force), @(0.3*self.springAble.force), @0];
            keyframeAnimation.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
            keyframeAnimation.duration = (CFTimeInterval)(self.springAble.duration);
            keyframeAnimation.additive = YES;
            keyframeAnimation.beginTime = CACurrentMediaTime() + (CFTimeInterval)(self.springAble.delay);
            [self.springAble.layer addAnimation:keyframeAnimation forKey:@"swing"];
        }
        default:
            break;
    }
}

- (CAMediaTimingFunction *) getTimingFunction:(TimingFunctionSytle)curve
{
    switch (curve) {
        case EaseInFunction:
            return [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            break;
        case EaseOutFunction:
            return [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            break;
        case EaseInOutFunction:
            return [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            break;
        case LinearFunction:
            return [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            break;
        case SpringFunction:
            return [CAMediaTimingFunction functionWithControlPoints:0.5 :1.1+(float)(self.springAble.force/3.0) :
                    1 :1];
            break;
        default:
            return [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
            break;
    }
}

- (UIViewAnimationOptions)getAnimationOptions:(TimingFunctionSytle)curve
{
    switch (curve) {
        case EaseInFunction:
            
            return UIViewAnimationOptionCurveEaseIn;
            break;
        case EaseOutFunction:
            return UIViewAnimationOptionCurveEaseOut;
            break;
        case EaseInOutFunction:
            return UIViewAnimationOptionCurveEaseInOut;
            break;
        case LinearFunction:
            return UIViewAnimationOptionCurveLinear;
        case SpringFunction:
            return UIViewAnimationOptionCurveLinear;
        default:
            return UIViewAnimationOptionCurveLinear;
            break;
    }
}

- (void)animate
{
    self.springAble.animateFrom = NO;
    [self animatePreset];
    [self setSpringAnimation:nil];
}

- (void)animateNext:(void (^)(void))completion
{
    self.springAble.animateFrom = YES;
    [self animatePreset];
    [self setSpringAnimation:completion];
}

- (void)animateTo
{
    self.springAble.animateFrom = NO;
    [self animatePreset];
    [self setSpringAnimation:nil];
}

- (void)animateToNext:(void (^)(void))completion
{
    self.springAble.animateFrom = NO;
    [self animatePreset];
    [self setSpringAnimation:completion];
}

- (void)customAwakeFromNib
{
    if (self.springAble.autohide) {
        self.springAble.alpha = 0;
    }
}

- (void)customDidMoveToWindow
{
    if (self.springAble.autostart) {
        self.springAble.alpha = 0;
        self.springAble.animateFrom = YES;
        [self animatePreset];
        [self setSpringAnimation:nil];
    }
}

- (void)setSpringAnimation:(void (^)(void))completion
{
//    if (self.springAble.animateFrom) {
//        CGAffineTransform translate = CGAffineTransformMakeTranslation(self.springAble.x, self.springAble.y);
//        CGAffineTransform scale = CGAffineTransformMakeScale(self.springAble.scaleX, self.springAble.scaleY);
//        CGAffineTransform rotate = CGAffineTransformMakeRotation(self.springAble.rotate);
//        CGAffineTransform translateAndScale = CGAffineTransformConcat(translate, scale);
//        self.springAble.transform = CGAffineTransformConcat(rotate, translateAndScale);
//        self.springAble.alpha = self.springAble.opacity;
//    }
    
    [UIView animateWithDuration:self.springAble.duration delay:self.springAble.delay usingSpringWithDamping:self.springAble.damping initialSpringVelocity:self.springAble.velocity options:[self getAnimationOptions:self.springAble.curve] animations:^{
        if (self.springAble.animateFrom) {
            self.springAble.transform = CGAffineTransformIdentity;
            self.springAble.alpha = 1;
        } else {
            CGAffineTransform translate = CGAffineTransformMakeTranslation(self.springAble.x, self.springAble.y);
            CGAffineTransform scale = CGAffineTransformMakeScale(self.springAble.scaleX, self.springAble.scaleY);
            CGAffineTransform rotate = CGAffineTransformMakeRotation(self.springAble.rotate);
            CGAffineTransform translateAndScale = CGAffineTransformConcat(translate, scale);
            self.springAble.transform = CGAffineTransformConcat(rotate, translateAndScale);
            self.springAble.alpha = self.springAble.opacity;
        }
    } completion:^(BOOL finished) {
        completion();
        [self resetAll];
    }];
}

- (void)reset
{
    self.springAble.x = 0;
    self.springAble.y = 0;
    self.springAble.opacity = 1;
}

- (void)resetAll
{
    self.springAble.x = 0;
    self.springAble.y = 0;
    self.springAble.animation = NoneStyle;
    self.springAble.opacity = 1;
    self.springAble.scaleX = 1;
    self.springAble.scaleY = 1;
    self.springAble.rotate = 0;
    self.springAble.damping = 0.7;
    self.springAble.velocity = 0.7;
    self.springAble.repeatCount = 1;
    self.springAble.delay = 0;
    self.springAble.duration = 0.7;
}

@end
