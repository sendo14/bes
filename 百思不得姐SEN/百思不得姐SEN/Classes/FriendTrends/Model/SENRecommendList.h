//
//  SENRecommendList.h
//  百思不得姐SEN
//
//  Created by sendo on 16/11/25.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SENRecommendList : NSObject

@property (nonatomic, assign) NSInteger ID; // ID
@property (nonatomic, assign) NSInteger count; // 总数
@property (nonatomic, copy) NSString *name; // 名字

/** 这个类别对应的用户数据 */
@property (nonatomic, strong) NSMutableArray *users;

@end
