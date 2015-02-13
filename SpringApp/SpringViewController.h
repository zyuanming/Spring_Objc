//
//  SpringViewController.h
//  SpringApp
//
//  Created by ming on 15/2/12.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpringVIew.h"

@interface SpringViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *delayLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *forceLabel;
@property (weak, nonatomic) IBOutlet UISlider *delaySlider;
@property (weak, nonatomic) IBOutlet UISlider *durationSlider;
@property (weak, nonatomic) IBOutlet UISlider *forceSlider;
@property (weak, nonatomic) IBOutlet SpringView *ballView;
@property (weak, nonatomic) IBOutlet UIPickerView *animationPicker;

- (void)maximizeView:(id)sender;
- (void)minimizeView:(id)sender;

@end
