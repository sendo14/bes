//
//  SENWordViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 17/1/5.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import "SENWordViewController.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <MJExtension.h>
#import <MJRefresh.h>
#import "SENTopic.h"

@interface SENWordViewController ()

@property (nonatomic, strong) NSMutableArray *topics;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, copy) NSString *maxtime;


@end

@implementation SENWordViewController

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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)setupRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
//    self.tableView.mj_footer.hidden = YES;
    
}

- (void)loadNewTopics{
    self.page = 0;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"29";
    
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php"
                             parameters:params
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    self.maxtime = responseObject[@"info"][@"maxtime"];
                                    
                                    self.topics = [SENTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
                                    
                                    [self.tableView reloadData];
                                    [self.tableView.mj_header endRefreshing];
                                }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    [self.tableView.mj_header endRefreshing];
                                }];
}

- (void)loadMoreTopics{
    self.page++;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"29";
    params[@"page"] = @(self.page);
    params[@"maxtime"] = self.maxtime;
    
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php"
                             parameters:params
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    self.maxtime = responseObject[@"info"][@"maxtime"];
                                    
                                    NSArray *newTopics = [SENTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
                                    [self.topics addObjectsFromArray:newTopics];
                                    
                                    [self.tableView reloadData];
                                    [self.tableView.mj_footer endRefreshing];
                                }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    [self.tableView.mj_footer endRefreshing];
                                }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    SENTopic *topic = self.topics[indexPath.row];
    cell.textLabel.text = topic.name;
    cell.detailTextLabel.text = topic.text;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image]
                      placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    return cell;
}

@end
