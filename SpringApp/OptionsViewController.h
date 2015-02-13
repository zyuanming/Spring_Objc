//
//  OptionsViewController.h
//  SpringApp
//
//  Created by ming on 15/2/12.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpringView.h"

@protocol OptionsViewControllerDelegate <NSObject>

- (void)dampingSliderChanged:(id)sender;
- (void)velocitySliderChanged:(id)sender;
- (void)scaleSliderChanged:(id)sender;
- (void)xSliderChanged:(id)sender;
- (void)ySliderChanged:(id)sender;
- (void)rotateSliderChanged:(id)sender;
- (void)resetButtonPressed:(id)sender;

@end

@interface OptionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet SpringView *modalView;
@property (weak, nonatomic) IBOutlet UILabel *dampingLabel;
@property (weak, nonatomic) IBOutlet UILabel *velocityLabel;
@property (weak, nonatomic) IBOutlet UILabel *scaleLabel;
@property (weak, nonatomic) IBOutlet UILabel *xLabel;
@property (weak, nonatomic) IBOutlet UILabel *yLabel;
@property (weak, nonatomic) IBOutlet UILabel *rotateLabel;

@property (weak, nonatomic) IBOutlet UISlider *dampingSlider;
@property (weak, nonatomic) IBOutlet UISlider *velocitySlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;
@property (weak, nonatomic) IBOutlet UISlider *xSlider;
@property (weak, nonatomic) IBOutlet UISlider *ySlider;
@property (weak, nonatomic) IBOutlet UISlider *rotateSlider;

@property (strong, nonatomic) SpringView *data;

@property (weak, nonatomic) id<OptionsViewControllerDelegate> delegate;

@end
