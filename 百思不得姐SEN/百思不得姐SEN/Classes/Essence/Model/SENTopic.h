//
//  SENTopic.h
//  百思不得姐SEN
//
//  Created by sendo on 17/1/10.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SENTopic : NSObject

@property (nonatomic, copy) NSString *profile_image;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) NSInteger ding;
@property (nonatomic, assign) NSInteger cai;
@property (nonatomic, assign) NSInteger repost;
@property (nonatomic, assign) NSInteger comment;

@property (nonatomic, assign, getter=isSina_v) BOOL sina_v;

@property (nonatomic, assign, readonly) CGFloat cellHeight;



@end
