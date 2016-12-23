//
//  SENRecommendList.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/25.
//  Copyright © 2016年 sendo. All rights reserved.
//  推荐关注 左边的数据模型

#import "SENRecommendList.h"

@implementation SENRecommendList

- (NSMutableArray *)users{
    if (! _users) {
        _users = [NSMutableArray array];
    }
    return _users;
}

@end
