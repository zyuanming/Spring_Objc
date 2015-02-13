//
//  CodeViewController.h
//  SpringApp
//
//  Created by ming on 15/2/12.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpringView.h"

@interface CodeViewController : UIViewController

@property (weak, nonatomic) IBOutlet SpringView *modalView;
@property (weak, nonatomic) IBOutlet UITextView *codeTextView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) SpringView *data;

@end
