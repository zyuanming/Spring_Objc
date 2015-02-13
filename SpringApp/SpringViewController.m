//
//  SpringViewController.m
//  SpringApp
//
//  Created by ming on 15/2/12.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "SpringViewController.h"
#import "OptionsViewController.h"
#import "CodeViewController.h"
#import "SpringAnimation.h"

@interface SpringViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, OptionsViewControllerDelegate>

@property (assign, nonatomic) NSInteger selectedRow;
@property (assign, nonatomic) NSInteger selectedEasing;
@property (assign, nonatomic) CGFloat selectedForce;
@property (assign, nonatomic) CGFloat selectedDuration;
@property (assign, nonatomic) CGFloat selectedDelay;
@property (assign, nonatomic) CGFloat selectedDamping;
@property (assign, nonatomic) CGFloat selectedVelocity;
@property (assign, nonatomic) CGFloat selectedScale;
@property (assign, nonatomic) CGFloat selectedX;
@property (assign, nonatomic) CGFloat selectedY;
@property (assign, nonatomic) CGFloat selectedRotate;
@property (strong, nonatomic) NSArray *data;
@property (assign, nonatomic) NSInteger ballState;

@end

@implementation SpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ballState = 0;
    _selectedForce = 1;
    _selectedDuration = 1;
    _selectedDelay = 0;
    
    _selectedDamping = 0.7;
    _selectedVelocity = 0.7;
    _selectedScale = 1;
    _selectedX = 0;
    _selectedY = 0;
    _selectedRotate = 0;
    
    _selectedRow = 0;
    _selectedEasing = 0;
    
    self.data = @[@[
                        @"shake",
                        @"pop",
                        @"morph",
                        @"squeeze",
                        @"wobble",
                        @"swing",
                        @"flipX",
                        @"flipY",
                        @"fall",
                        @"squeezeLeft",
                        @"squeezeRight",
                        @"squeezeDown",
                        @"squeezeUp",
                        @"slideLeft",
                        @"slideRight",
                        @"slideDown",
                        @"slideUp",
                        @"fadeIn",
                        @"fadeOut",
                        @"fadeInLeft",
                        @"fadeInRight",
                        @"fadeInDown",
                        @"fadeInUp",
                        @"zoomIn",
                        @"zoomOut",
                        @"flash",
                        ], @[@"spring", @"linear", @"easeIn", @"easeOut", @"easeInOut"]];
    
    _animationPicker.delegate = self;
    _animationPicker.dataSource = self;
    _animationPicker.showsSelectionIndicator = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - OptionsViewControllerDelegate

- (void)dampingSliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _selectedDamping = slider.value;
    [self animateView];
}

- (void)velocitySliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _selectedVelocity = slider.value;
    [self animateView];
}

- (void)scaleSliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _selectedScale = slider.value;
    [self animateView];
}

- (void)xSliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _selectedX = slider.value;
    [self animateView];
}

- (void)ySliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _selectedY = slider.value;
    [self animateView];
}

- (void)rotateSliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _selectedRotate = slider.value;
    [self animateView];
}

- (void)resetButtonPressed:(id)sender
{
    _selectedForce = 1;
    _selectedDuration = 1;
    _selectedDelay = 0;
    
    _selectedDamping = 0.7;
    _selectedVelocity = 0.7;
    _selectedScale = 1;
    _selectedX = 0;
    _selectedY = 0;
    _selectedRotate = 0;
    
    [_forceSlider setValue:_selectedForce animated:YES];
    [_durationSlider setValue:_selectedDuration animated:YES];
    [_delaySlider setValue:_selectedDelay animated:YES];
    
    _forceLabel.text = [NSString stringWithFormat:@"Force: %.1f", _selectedForce];
    _durationLabel.text = [NSString stringWithFormat:@"Duration: %.1f", _selectedDuration];
    _delayLabel.text = [NSString stringWithFormat:@"Delay: %.1f", _selectedDelay];
}


#pragma mark - Action

- (IBAction)forceSliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _selectedForce = slider.value;
    [self animateView];
    _forceLabel.text = [NSString stringWithFormat:@"Force: %.1f", _selectedForce];
}

- (IBAction)durationSliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _selectedDuration = slider.value;
    [self animateView];
    _durationLabel.text = [NSString stringWithFormat:@"Duration: %.1f", _selectedDuration];
}

- (IBAction)delaySliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _selectedDelay = slider.value;
    [self animateView];
    _delayLabel.text = [NSString stringWithFormat:@"Delay: %.1f", _selectedDelay];
}

- (IBAction)shapeButtonPressed:(id)sender
{
    [self changeBall];
}

- (IBAction)ballButtonPressed:(id)sender
{
    [UIView animateWithDuration:0.1 animations:^{
        self.ballView.backgroundColor = [UIColor colorWithRed:105.0 green:219.0 blue:255.0 alpha:1.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            // 以第一种形式设置颜色，会变成白色，跟动画框架有些关系
//            self.ballView.backgroundColor = [UIColor colorWithRed:105.0 green:219.0 blue:255.0 alpha:1.0];
            self.ballView.backgroundColor = [UIColor blueColor];
        }];
    }];
    [self animateView];
}


#pragma mark - UIPickerViewDelegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return ((NSArray *)(_data[component])).count;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _data[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
    case 0:
            _selectedRow = row;
            [self animateView];
            break;
    default:
            _selectedEasing = row;
            [self animateView];
            break;
    }
}


#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}


#pragma mark - Override

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[OptionsViewController class]]) {
        OptionsViewController *optionsViewController = segue.destinationViewController;
        optionsViewController.delegate = self;
        [self setOptions];
        optionsViewController.data = _ballView;
    }
    else if ([segue.destinationViewController isKindOfClass:[CodeViewController class]]) {
        CodeViewController *codeViewController = segue.destinationViewController;
        [self setOptions];
        codeViewController.data = _ballView;
    }
}


#pragma mark -

- (void)animateView
{
    [self setOptions];
   [_ballView animate];
}

- (void)setOptions
{
    _ballView.force = _selectedForce;
    _ballView.duration = _selectedDuration;
    _ballView.delay = _selectedDelay;
    
    _ballView.damping = _selectedDamping;
    _ballView.velocity = _selectedVelocity;
    _ballView.scaleX = _selectedScale;
    _ballView.scaleY = _selectedScale;
    _ballView.x = _selectedX;
    _ballView.y = _selectedY;
    _ballView.rotate = _selectedRotate;
    
    _ballView.animation = _data[0][_selectedRow];
    _ballView.curve = _data[1][_selectedEasing];
}

- (void)changeBall
{
    switch (_ballState) {
    case 1:
        {
            CABasicAnimation *animation = [[CABasicAnimation alloc]init];
            animation.keyPath = @"cornerRadius";
            animation.fromValue = @(50);
            animation.toValue = @(10);
            animation.duration = 0.2;
            _ballView.layer.cornerRadius = 10;
            [_ballView.layer addAnimation:animation forKey:@"radius"];
            _ballState = 0;
        }
    default:
        {
            CABasicAnimation *animation = [[CABasicAnimation alloc]init];
            animation.keyPath = @"cornerRadius";
            animation.fromValue = @(10);
            animation.toValue = @(50);
            animation.duration = 0.2;
            _ballView.layer.cornerRadius = 50;
            [_ballView.layer addAnimation:animation forKey:@"radius"];
            _ballState++;
        }
    }
    CABasicAnimation *animation = [[CABasicAnimation alloc]init];
    animation.keyPath = @"opacity";
    animation.fromValue = @(1);
    animation.toValue = @(0);
    animation.duration = 0.2;
    animation.autoreverses = YES;
    [_ballView.layer addAnimation:animation forKey:@"fade"];
}

- (void)maximizeView:(id)sender
{
    [SpringAnimation springWithDuration:0.7 animations:^{
        self.view.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)minimizeView:(id)sender
{
    [SpringAnimation springWithDuration:0.7 animations:^{
        self.view.transform = CGAffineTransformMakeScale(0.935, 0.935);
    }];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

@end
