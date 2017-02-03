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

/** 图片相关 */
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, copy) NSString *pictureS_URL;
@property (nonatomic, copy) NSString *pictureM_URL;
@property (nonatomic, copy) NSString *pictureL_URL;

@property (nonatomic, assign) SENTopicType type;


/** 辅助属性 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;
@property (nonatomic, assign, readonly) CGRect pictureFrame;

@property (nonatomic, assign, getter=isBigPicture) BOOL bigPicture;

@property (nonatomic, assign) CGFloat pictureProgress;


@end
