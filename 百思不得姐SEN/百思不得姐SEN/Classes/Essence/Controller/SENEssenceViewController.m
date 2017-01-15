//
//  SENEssenceViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/16.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENEssenceViewController.h"

#import "SENTopicViewController.h"

@interface SENEssenceViewController() <UIScrollViewDelegate>

@property (nonatomic, weak) UIView *titlesView;
@property (nonatomic, weak) UIView *indicatorView;
@property (nonatomic, weak) UIButton *selectedBtn;
@property (nonatomic, weak) UIScrollView *contentView;

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
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.sen_width * self.childViewControllers.count, 0);
    self.contentView = contentView;
    
    [self scrollViewDidEndScrollingAnimation:contentView];
}

- (void)setupTitlesView{
    
    // setup titlesView
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.7];
    titlesView.sen_width = self.view.sen_width;
    titlesView.sen_height = SENTitlesViewH;
    titlesView.sen_y = SENTitlesViewY;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // setupIndicator
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.sen_height = 2;
    indicatorView.sen_y = titlesView.sen_height - indicatorView.sen_height;
    indicatorView.tag = -1;
    self.indicatorView = indicatorView;
    
    // setupBtn
//    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    CGFloat width = titlesView.sen_width / self.childViewControllers.count;
    CGFloat height = titlesView.sen_height;
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.sen_width = width;
        btn.sen_height = height;
        btn.sen_x = i * width;
        btn.tag = i;
        
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:btn];
        
        if (i == 0) {
            btn.enabled = NO;
            self.selectedBtn = btn;
            
            [btn.titleLabel sizeToFit];
            self.indicatorView.sen_width = btn.titleLabel.sen_width;
            self.indicatorView.sen_centerX = btn.sen_centerX;
        }
    }
    [titlesView addSubview:indicatorView];// 指示器放在最后
}

- (void)titleClick:(UIButton *)btn{
    self.selectedBtn.enabled = YES;
    btn.enabled = NO;
    self.selectedBtn = btn;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.sen_width = btn.titleLabel.sen_width;
        self.indicatorView.sen_centerX = btn.sen_centerX;
    }];
    
    CGPoint offset = self.contentView.contentOffset;
    offset.x = self.contentView.sen_width * btn.tag;
    [self.contentView setContentOffset:offset animated:YES];
}

- (void)setupChildVC{

    SENTopicViewController *allVC = [[SENTopicViewController alloc] init];
    allVC.title = @"全部";
    allVC.type = SENTopicTypeAll;
    [self addChildViewController:allVC];
    
    SENTopicViewController *pictureVC = [[SENTopicViewController alloc] init];
    pictureVC.title = @"图片";
    pictureVC.type = SENTopicTypePicture;
    [self addChildViewController:pictureVC];
    
    SENTopicViewController *wordVC = [[SENTopicViewController alloc] init];
    wordVC.title = @"段子";
    wordVC.type = SENTopicTypeWord;
    [self addChildViewController:wordVC];

    SENTopicViewController *voiceVC = [[SENTopicViewController alloc] init];
    voiceVC.title = @"声音";
    voiceVC.type = SENTopicTypeVoice;
    [self addChildViewController:voiceVC];
    
    SENTopicViewController *videoVC = [[SENTopicViewController alloc] init];
    videoVC.title = @"视频";
    videoVC.type = SENTopicTypeVideo;
    [self addChildViewController:videoVC];
    
}

- (void)setupNaviItem{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemwith:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    self.view.backgroundColor = SENGlobalBG;
}

- (void)tagClick{
    SENLogFunc;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / scrollView.sen_width;
    
    UIViewController *vc = self.childViewControllers[index];
    vc.view.sen_x = scrollView.contentOffset.x;
    vc.view.sen_y = 0; // 默认20
    vc.view.sen_height = scrollView.sen_height; // y上移之后整体上移了20，所以要重新设置高度
    
    [scrollView addSubview:vc.view];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    NSInteger index = scrollView.contentOffset.x / scrollView.sen_width;
    [self titleClick:self.titlesView.subviews[index]];
}









@end
