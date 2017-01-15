//
//  SENTopicViewController.h
//  百思不得姐SEN
//
//  Created by sendo on 17/1/15.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SENTopicType) {
    SENTopicTypeAll = 1,
    SENTopicTypePicture = 10,
    SENTopicTypeWord = 29,
    SENTopicTypeVoice = 31,
    SENTopicTypeVideo = 41,
};

@interface SENTopicViewController : UITableViewController

@property (nonatomic, assign) SENTopicType type;


@end
