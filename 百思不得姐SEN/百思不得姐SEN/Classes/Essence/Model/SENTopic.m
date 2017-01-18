//
//  SENTopic.m
//  百思不得姐SEN
//
//  Created by sendo on 17/1/10.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import "SENTopic.h"

@implementation SENTopic
{
    CGFloat _cellHeight;
}

- (CGFloat)cellHeight{
    
    if (!_cellHeight) {
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - SENTopicCellMargin * 4, MAXFLOAT);
        CGFloat textH = [self.text boundingRectWithSize:maxSize
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]}
                                                context:nil].size.height;
        
        _cellHeight = SENTopicCellTextY + textH + SENTopicCellBottomBarH + SENTopicCellMargin * 2;
    }
    
    return _cellHeight;
}

- (NSString *)create_time{
    // 转格式
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *creatTime = [fmt dateFromString:_create_time];
    
    // 根据不同情况赋值,return string
    if (creatTime.isThisYear) {
        if (creatTime.isToday) {
            NSDateComponents *cmps = [[NSDate date] gapFromDate:creatTime];
            
            if (cmps.hour >= 1) {
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) {
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else {
                return @"刚刚";
            }
        } else if (creatTime.isYesterday) {
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:creatTime];
        } else {
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:creatTime];
        }
    } else {
        return _create_time;
    }
}

@end
