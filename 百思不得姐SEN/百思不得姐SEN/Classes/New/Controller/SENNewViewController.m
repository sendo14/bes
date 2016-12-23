//
//  SENNewViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/16.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENNewViewController.h"

@implementation SENNewViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemwith:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    self.view.backgroundColor = SENGlobalBG;
}

- (void)tagClick{
    SENLogFunc;
}
@end
