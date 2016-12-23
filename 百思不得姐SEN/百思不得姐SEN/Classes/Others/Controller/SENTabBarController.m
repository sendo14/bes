//
//  SENTabBarController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/15.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENTabBarController.h"
#import "SENEssenceViewController.h"
#import "SENNewViewController.h"
#import "SENFriendTrendsViewController.h"
#import "SENMeViewController.h"
#import "SENTabBar.h"
#import "SENNavigationController.h"

@implementation SENTabBarController

// 一次性设置
+ (void)initialize{
    //统一设置tabBarItem文字属性
    NSMutableDictionary *attri = [[NSMutableDictionary alloc] init];
    attri[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attri[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttri = [[NSMutableDictionary alloc] init];
    selectedAttri[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttri[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attri forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttri forState:UIControlStateSelected];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // addChildVC
    [self setupChildVC:[[SENEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupChildVC:[[SENNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setupChildVC:[[SENFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setupChildVC:[[SENMeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    // 更换tabBar
    [self setValue:[[SENTabBar alloc] init] forKeyPath:@"tabBar"];

    
}

// 初始化子控制器

- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    // set title&image
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
 
    
    // addChildVC
    SENNavigationController *nav = [[SENNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    

}










@end
