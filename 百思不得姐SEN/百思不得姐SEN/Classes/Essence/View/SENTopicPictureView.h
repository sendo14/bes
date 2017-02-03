//
//  SENTopicPictureView.h
//  百思不得姐SEN
//
//  Created by sendo on 17/2/3.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SENTopic;

@interface SENTopicPictureView : UIView

@property (nonatomic, strong) SENTopic *topic;

+ (instancetype)pictureView;

@end
