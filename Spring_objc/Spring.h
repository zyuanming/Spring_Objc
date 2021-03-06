//
//  Spring.h
//  SpringApp
//
//  Created by ming on 15/2/6.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>

@protocol Springable <NSObject>

@property (nonatomic, assign) BOOL autostart;
@property (nonatomic, assign) BOOL autohide;
@property (nonatomic, strong) NSString *animation;
@property (nonatomic, assign) CGFloat force;
@property (nonatomic, assign) CGFloat delay;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) CGFloat damping;
@property (nonatomic, assign) CGFloat velocity;
@property (nonatomic, assign) CGFloat repeatCount;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat scaleX;
@property (nonatomic, assign) CGFloat scaleY;
@property (nonatomic, assign) CGFloat rotate;
@property (nonatomic, assign) CGFloat opacity;
@property (nonatomic, assign) BOOL animateFrom;
@property (nonatomic, strong) NSString *curve;
@property (nonatomic, assign, readonly) CALayer *layer;
@property (nonatomic, assign) CGAffineTransform transform;
@property (nonatomic, assign) CGFloat alpha;


@end

@interface Spring : NSObject

- (instancetype)initWith:(id<Springable>) springAble;
- (void)animate;
- (void)animateNext:(void (^)(void))completion;
- (void)animateTo;
- (void)animateToNext:(void (^)(void))completion;
- (void)customAwakeFromNib;
- (void)customDidMoveToWindow;

@end
