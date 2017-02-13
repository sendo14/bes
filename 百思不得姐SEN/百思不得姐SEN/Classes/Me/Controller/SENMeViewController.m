//
//  SENMeViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/16.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENMeViewController.h"
//#import "SENTestViewViewController.h"

@implementation SENMeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemwith:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    UIBarButtonItem *nightModeItem = [UIBarButtonItem itemwith:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(nightModeClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,nightModeItem];
    
    self.view.backgroundColor = SENGlobalBG;

}

- (void)settingClick{
    SENLogFunc;
}

- (void)nightModeClick{

}

@end
