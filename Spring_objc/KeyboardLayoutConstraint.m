//
//  KeyboardLayoutConstraint.m
//  SpringApp
//
//  Created by ming on 15/2/9.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "KeyboardLayoutConstraint.h"

@interface KeyboardLayoutConstraint()

@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, assign) CGFloat keyboardVisibleHeight;

@end

@implementation KeyboardLayoutConstraint

- (void)awakeFromNib
{
    [super awakeFromNib];
    _offset = self.constant;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillShowNotification:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    if (userInfo) {
        NSValue *frameValue = userInfo[UIKeyboardFrameEndUserInfoKey];
        if (frameValue) {
            CGRect frame = [frameValue CGRectValue];
            _keyboardVisibleHeight = frame.size.height;
        }
        [self updateConstant];
        NSNumber *duration = userInfo[UIKeyboardAnimationDurationUserInfoKey];
        NSNumber *curve = userInfo[UIKeyboardAnimationCurveUserInfoKey];
        if (duration && curve) {
            UIViewAnimationOptions options = curve.unsignedLongValue;
            [UIView animateWithDuration:duration.doubleValue delay:0.0 options:options animations:^{
                [[UIApplication sharedApplication].keyWindow layoutIfNeeded];
            } completion:nil];
        }
    }
}

- (void)keyboardWillHideNotification:(NSNotification *)notification
{
    _keyboardVisibleHeight = 0;
    [self updateConstant];
    NSDictionary *userInfo = notification.userInfo;
    if (userInfo) {
        NSValue *frameValue = userInfo[UIKeyboardFrameEndUserInfoKey];
        if (frameValue) {
            CGRect frame = [frameValue CGRectValue];
            _keyboardVisibleHeight = frame.size.height;
        }
        
        NSNumber *duration = userInfo[UIKeyboardAnimationDurationUserInfoKey];
        NSNumber *curve = userInfo[UIKeyboardAnimationCurveUserInfoKey];
        if (duration && curve) {
            UIViewAnimationOptions options = curve.unsignedLongValue;
            [UIView animateWithDuration:duration.doubleValue delay:0.0 options:options animations:^{
                [[UIApplication sharedApplication].keyWindow layoutIfNeeded];
            } completion:nil];
        }
    }
}

- (void)updateConstant
{
    self.constant = _offset + _keyboardVisibleHeight;
}

@end
