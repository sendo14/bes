//
//  SENPictureViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 17/1/5.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import "SENPictureViewController.h"

@interface SENPictureViewController ()

@end

@implementation SENPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = [UIColor yellowColor];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@----%zd", [self class], indexPath.row];
    
    return cell;
}

@end
