//
//  SENEssenceViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/16.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENEssenceViewController.h"

#import "SENAllViewController.h"
#import "SENVideoViewController.h"
#import "SENVoiceViewController.h"
#import "SENPictureViewController.h"
#import "SENWordViewController.h"

@interface SENEssenceViewController() <UIScrollViewDelegate>

@end

@implementation SENEssenceViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setupNaviItem];
    [self setupChildVC];
    [self setupTitlesView];
    [self setupContentView];
}

- (void)setupContentView{

}

- (void)setupTitlesView{

}

- (void)setupChildVC{
    SENAllViewController *allVC = [[SENAllViewController alloc] init];
    [self addChildViewController:allVC];
    
    SENVideoViewController *videoVC = [[SENVideoViewController alloc] init];
    [self addChildViewController:videoVC];
    
    SENVoiceViewController *voiceVC = [[SENVoiceViewController alloc] init];
    [self addChildViewController:voiceVC];
    
    SENPictureViewController *pictureVC = [[SENPictureViewController alloc] init];
    [self addChildViewController:pictureVC];
    
    SENWordViewController *wordVC = [[SENWordViewController alloc] init];
    [self addChildViewController:wordVC];
}

- (void)setupNaviItem{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemwith:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    self.view.backgroundColor = SENGlobalBG;
}

- (void)tagClick{
    SENLogFunc;
}













@end
