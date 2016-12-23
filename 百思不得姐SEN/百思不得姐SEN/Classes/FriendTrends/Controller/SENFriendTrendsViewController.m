//
//  SENFriendTrendsViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/16.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENFriendTrendsViewController.h"
#import "SENRecommendViewController.h"
#import "SENLoginViewController.h"

@implementation SENFriendTrendsViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemwith:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    
    self.view.backgroundColor = SENGlobalBG;

}

- (void)friendsClick{
    SENRecommendViewController *vc = [[SENRecommendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)loginButton:(id)sender {
    SENLoginViewController *vc = [[SENLoginViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    
}

@end
