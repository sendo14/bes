//
//  SENRecommendViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/22.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENRecommendViewController.h"


#import "SENRecommendList.h"
#import "SENRecommendUser.h"

#import "SENRecommendListCell.h"
#import "SENRecommendUserCell.h"


// pods
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "MJRefresh.h"

#define SENSelectedListNumber self.lists[self.listTableView.indexPathForSelectedRow.row]

@interface SENRecommendViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *lists; // 左边的类别数据

@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@end

@implementation SENRecommendViewController

static NSString * const SENListID = @"list";
static NSString * const SENUserID = @"user";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupRefresh];
    
    [SVProgressHUD show];
    #warning 这里有一个遮罩问题没解决
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        SENLog(@"%@", responseObject[@"list"]);
        [SVProgressHUD dismiss];
        
        // 服务器返回的json数据
        self.lists = [SENRecommendList mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.listTableView reloadData];
        
        // 默认选中首行
        [self.listTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
}

- (void)setupTableView{
    // 注册
    [self.listTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SENRecommendListCell class]) bundle:nil] forCellReuseIdentifier:SENListID];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SENRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:SENUserID];
    
    // 顶部缩进
    self.automaticallyAdjustsScrollViewInsets= NO;
    self.listTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.listTableView.contentInset;
    
    self.userTableView.rowHeight = 60;
    
    self.title = @"推荐关注";
    self.view.backgroundColor = SENGlobalBG;
    
}

- (void)setupRefresh{
    self.userTableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    self.userTableView.mj_footer.hidden = YES;
}

- (void)loadMoreUsers{
    SENRecommendList *listRow = SENSelectedListNumber;
//    SENRecommendList *listRow = self.lists[self.listTableView.indexPathForSelectedRow.row];

    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(listRow.id); // ???
    params[@"page"] = @"2";
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *users = [SENRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [listRow.users addObjectsFromArray:users];
        
        [self.userTableView reloadData];
//        SENLog(@"%@", responseObject[@"list"]);
        
        [self.userTableView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SENLog(@"%@", error);
    }];

}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.listTableView) {
        return self.lists.count;
    } else {
        SENRecommendList *listNumber = SENSelectedListNumber; // 得到左边选中的行号，取出对应的模型
        #warning 这里不太懂为什么
        
        NSInteger listCount = listNumber.users.count;
        self.userTableView.mj_footer.hidden = (listCount == 0); // ???
        return listCount;

    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == self.listTableView) {
        SENRecommendListCell *cell = [tableView dequeueReusableCellWithIdentifier:SENListID];
        cell.list = self.lists[indexPath.row];
        return cell;
    } else {
        SENRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:SENUserID];
        
        SENRecommendList *listNumber = SENSelectedListNumber;// 得到左边选中的行号，取出对应的模型
        #warning 这里不太懂为什么
        cell.user = listNumber.users[indexPath.row];
        return cell;
    }
}


#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    SENRecommendList *listRow = self.lists[indexPath.row];
    
    if (listRow.users.count) {
        [self.userTableView reloadData];
    } else {
        [self.userTableView reloadData];
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"list";
        params[@"c"] = @"subscribe";
        params[@"category_id"] = @(listRow.id); // ???
        
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSArray *users = [SENRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            [listRow.users addObjectsFromArray:users];
            #warning 这里不是很懂，为什么会知道是哪个类别对应的数据，params[@"category_id"]的原因吗？
            
            [self.userTableView reloadData];
//            SENLog(@"%@", responseObject[@"list"]);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            SENLog(@"%@", error);
        }];
    }
}





























@end
