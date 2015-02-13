//
//  SpringImageView.m
//  SpringApp
//
//  Created by ming on 15/2/6.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "SpringImageView.h"

@interface SpringImageView()

@property (nonatomic, strong) Spring *spring;

@end

@implementation SpringImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _autostart = NO;
        _autohide = NO;
        _animation = @"";
        _force = 1;
        _delay = 0;
        _duration = 0.7;
        _damping = 0.7;
        _velocity = 0.7;
        _repeatCount = 1;
        _x = 0;
        _y = 0;
        _scaleX = 1;
        _scaleY = 1;
        _rotate = 0;
        _curve = @"";
        _animateFrom = NO;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(!self) {
        _autostart = NO;
        _autohide = NO;
        _animation = @"";
        _force = 1;
        _delay = 0;
        _duration = 0.7;
        _damping = 0.7;
        _velocity = 0.7;
        _repeatCount = 1;
        _x = 0;
        _y = 0;
        _scaleX = 1;
        _scaleY = 1;
        _rotate = 0;
        _curve = @"";
        _animateFrom = NO;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.spring customAwakeFromNib];
}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
    [self.spring customDidMoveToWindow];
}


#pragma mark - Setter

- (Spring *)spring
{
    if (!_spring) {
        _spring = [[Spring alloc]initWith:self];
    }
    return _spring;
}


#pragma mark -

- (void)animate
{
    [self.spring animate];
}

- (void)animateNext:(void (^)(void))completion
{
    [self.spring animateNext:completion];
}

- (void)animateTo
{
    [self.spring animateTo];
}

- (void)animateToNext:(void (^)(void))completion
{
    [self.spring animateToNext:completion];
}

@end
