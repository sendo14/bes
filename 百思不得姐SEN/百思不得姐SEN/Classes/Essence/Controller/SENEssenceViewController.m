//
//  SENEssenceViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/16.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENEssenceViewController.h"

@implementation SENEssenceViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemwith:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    self.view.backgroundColor = SENGlobalBG;
}

- (void)tagClick{
    SENLogFunc;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view.backgroundColor = SENGlobalBG;
//    [self.navigationController pushViewController:vc animated:YES];
//}













@end
