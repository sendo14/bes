//
//  SENWordViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 17/1/5.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import "SENTopicViewController.h"

#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <MJExtension.h>
#import <MJRefresh.h>

#import "SENTopic.h"
#import "SENTopicCell.h"

static NSString * const topicCellID = @"topic";

@interface SENTopicViewController ()

@property (nonatomic, strong) NSMutableArray *topics;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, copy) NSString *maxtime;

/** 上一次的请求参数 */
@property (nonatomic, strong) NSDictionary *params;
@end

@implementation SENTopicViewController

- (NSMutableArray *)topics{
    if (!_topics) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupRefresh];
}


- (void)setupTableView{
    
    CGFloat top = SENTitlesViewH + SENTitlesViewY;
    CGFloat bottom = self.tabBarController.tabBar.sen_height;
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SENTopicCell class]) bundle:nil] forCellReuseIdentifier:topicCellID];
}

- (void)setupRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
    //    self.tableView.mj_footer.hidden = YES;
    
}

- (void)loadNewTopics{
//    self.page = 0;
    [self.tableView.mj_footer endRefreshing];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    self.params = params;
    
    // http://api.budejie.com/api/api_open.php
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php"
                             parameters:params
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    if (self.params != params) return;
                                    
                                    self.maxtime = responseObject[@"info"][@"maxtime"];
                                    
                                    self.topics = [SENTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
                                    
                                    [self.tableView reloadData];
                                    [self.tableView.mj_header endRefreshing];
                                    
                                    // 清空页码
                                    self.page = 0;
                                }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    if (self.params != params) return;
                                    
                                    [self.tableView.mj_header endRefreshing];
                                }];
}

- (void)loadMoreTopics{
    [self.tableView.mj_header endRefreshing];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    NSInteger page = self.page + 1;
    params[@"page"] = @(page);
    params[@"maxtime"] = self.maxtime;
    self.params = params;
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php"
                             parameters:params
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    if (self.params != params) return;
                                    
                                    self.maxtime = responseObject[@"info"][@"maxtime"];
                                    
                                    NSArray *newTopics = [SENTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
                                    [self.topics addObjectsFromArray:newTopics];
                                    
                                    [self.tableView reloadData];
                                    [self.tableView.mj_footer endRefreshing];
                                    
                                    // 设置页码
                                    self.page = page;
                                }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    if (self.params != params) return;
                                    
                                    [self.tableView.mj_footer endRefreshing];
                                }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SENTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:topicCellID];
    
    cell.topic = self.topics[indexPath.row];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SENTopic *topic = self.topics[indexPath.row];

    return topic.cellHeight;
}

@end
