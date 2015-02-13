//
//  CodeViewController.m
//  SpringApp
//
//  Created by ming on 15/2/12.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "CodeViewController.h"

@interface CodeViewController ()

@property (strong, nonatomic) NSMutableString *codeText;

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _modalView.transform = CGAffineTransformMakeTranslation(-300, 0);
    self.codeText = [NSMutableString string];
    if (_data.animation.length > 0) {
        [_codeText appendString:[NSString stringWithFormat:@"layer.animation = %@\n", _data.animation]];
    }
    if (_data.curve.length > 0) {
        [_codeText appendString:[NSString stringWithFormat:@"layer.curve = %@\n", _data.curve]];
    }
    if (_data.force != 1) {
        [_codeText appendString:[NSString stringWithFormat:@"layer.force = %.1f\n", _data.force]];
    }
    if (_data.duration != 0.7) {
        [_codeText appendString:[NSString stringWithFormat:@"layer.duration = %.1f\n", _data.duration]];
    }
    if (_data.delay != 0) {
        [_codeText appendString:[NSString stringWithFormat:@"layer.delay = %.1f\n", _data.delay]];
    }
    if (_data.scaleX != 1) {
        [_codeText appendString:[NSString stringWithFormat:@"layer.scaleX = %.1f\n", _data.scaleX]];
    }
    if (_data.scaleY != 1) {
        [_codeText appendString:[NSString stringWithFormat:@"layer.scaleY = %.1f\n", _data.scaleY]];
    }
    if (_data.rotate != 0) {
        [_codeText appendString:[NSString stringWithFormat:@"layer.rotate = %.1f\n", _data.rotate]];
    }
    if (_data.damping != 0.7) {
        [_codeText appendString:[NSString stringWithFormat:@"layer.damping = %.1f\n", _data.damping]];
    }
    if (_data.velocity != 0.7) {
        [_codeText appendString:[NSString stringWithFormat:@"layer.velocity = %.1f\n", _data.velocity]];
    }
    [_codeText appendString:@"layer.animate()"];
    
    _codeTextView.text = _codeText;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_modalView animate];
    [[UIApplication sharedApplication] sendAction:@selector(minimizeView:) to:nil from:self forEvent:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action

- (IBAction)closeButtonPressed:(id)sender
{
    [[UIApplication sharedApplication] sendAction:@selector(maximizeView:) to:nil from:self forEvent:nil];
    _modalView.animation = @"slideRight";
    _modalView.animateFrom = NO;
    [_modalView animateToNext:^{
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

@end
