//
//  OptionsViewController.m
//  SpringApp
//
//  Created by ming on 15/2/12.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@property (assign, nonatomic) CGFloat selectedDamping;
@property (assign, nonatomic) CGFloat selectedVelocity;
@property (assign, nonatomic) CGFloat selectedScale;
@property (assign, nonatomic) CGFloat selectedX;
@property (assign, nonatomic) CGFloat selectedY;
@property (assign, nonatomic) CGFloat selectedRotate;

@end

@implementation OptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectedDamping = 0.7;
    self.selectedVelocity = 0.7;
    self.selectedScale = 1.0;
    self.selectedX = 0;
    self.selectedY = 0;
    self.selectedRotate = 0;
    
    _modalView.transform = CGAffineTransformMakeTranslation(0, 300);
    
    [_dampingSlider setValue:_data.damping animated:YES];
    [_velocitySlider setValue:_data.velocity animated:YES];
    [_scaleSlider setValue:_data.scaleX animated:YES];
    [_xSlider setValue:_data.x animated:YES];
    [_ySlider setValue:_data.y animated:YES];
    [_rotateSlider setValue:_data.rotate animated:YES];
    
    _dampingLabel.text = [self getStringWithName:@"Damping" withValue:_data.damping];
    _velocityLabel.text = [self getStringWithName:@"Velocity" withValue:_data.velocity];
    _scaleLabel.text = [self getStringWithName:@"Scale" withValue:_data.scaleX];
    _xLabel.text = [self getStringWithName:@"x" withValue:_data.x];
    _yLabel.text = [self getStringWithName:@"y" withValue:_data.y];
    _rotateLabel.text = [self getStringWithName:@"Rotate" withValue:_data.rotate];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] sendAction:@selector(minimizeView:) to:nil from:self forEvent:nil];
    [_modalView animate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action

- (IBAction)dampingSliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    _selectedDamping = slider.value;
    if ([_delegate respondsToSelector:@selector(dampingSliderChanged:)]) {
        [_delegate dampingSliderChanged:sender];
    }
    _dampingLabel.text = [self getStringWithName:@"Damping" withValue:_selectedDamping];
}

- (IBAction)velocitySliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    _selectedVelocity = slider.value;
    if ([_delegate respondsToSelector:@selector(velocitySliderChanged:)]) {
        [_delegate velocitySliderChanged:sender];
    }
    _velocityLabel.text = [self getStringWithName:@"Velocity" withValue:_selectedVelocity];
}

- (IBAction)scaleSliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    _selectedScale = slider.value;
    if ([_delegate respondsToSelector:@selector(scaleSliderChanged:)]) {
        [_delegate scaleSliderChanged:sender];
    }
    _scaleLabel.text = [self getStringWithName:@"Scale" withValue:_selectedScale];
}

- (IBAction)xSliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    _selectedX = slider.value;
    if ([_delegate respondsToSelector:@selector(xSliderChanged:)]) {
        [_delegate xSliderChanged:sender];
    }
    _xLabel.text = [self getStringWithName:@"X" withValue:_selectedX];
}

- (IBAction)ySliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    _selectedY = slider.value;
    if ([_delegate respondsToSelector:@selector(ySliderChanged:)]) {
        [_delegate ySliderChanged:sender];
    }
    _yLabel.text = [self getStringWithName:@"Y" withValue:_selectedY];
}

- (IBAction)rotateSliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    _selectedRotate = slider.value;
    if ([_delegate respondsToSelector:@selector(rotateSliderChanged:)]) {
        [_delegate rotateSliderChanged:sender];
    }
    _rotateLabel.text = [self getStringWithName:@"Rotate" withValue:_selectedRotate];
}

- (IBAction)resetButtonPressed:(id)sender {
    if ([_delegate respondsToSelector:@selector(resetButtonPressed:)]) {
        [_delegate resetButtonPressed:sender];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    [[UIApplication sharedApplication] sendAction:@selector(maximizeView:) to:nil from:self forEvent:nil];
}

- (IBAction)closeButtonPressed:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(maximizeView:) to:nil from:self forEvent:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark -

- (NSString *)getStringWithName:(NSString *)type withValue:(CGFloat)value
{
    return [NSString stringWithFormat:@"%@: %.1f", type, (double)value];
}

@end
