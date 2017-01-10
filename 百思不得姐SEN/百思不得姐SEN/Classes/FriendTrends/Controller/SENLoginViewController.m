//
//  SENLoginViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/12/3.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENLoginViewController.h"

@interface SENLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;

@end

@implementation SENLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginButton.layer.cornerRadius = 5;
    self.loginButton.layer.masksToBounds = YES;
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)rigester:(UIButton *)button{
    [self.view endEditing:YES];
    
    if (self.leftConstraint.constant == 0) {
        self.leftConstraint.constant = - self.view.sen_width;
        button.selected = YES;
    } else {
        self.leftConstraint.constant = 0;
        button.selected = NO;
    }
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
