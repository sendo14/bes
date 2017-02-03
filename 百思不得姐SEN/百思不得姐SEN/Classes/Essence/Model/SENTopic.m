//
//  SENTopic.m
//  百思不得姐SEN
//
//  Created by sendo on 17/1/10.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import "SENTopic.h"
#import <MJExtension.h>

@implementation SENTopic
{
    CGFloat _cellHeight;
    CGRect _pictureFrame;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"pictureS_URL" : @"image0",
             @"pictureM_URL" : @"image2",
             @"pictureL_URL" : @"image1"
             };
}

- (CGFloat)cellHeight{
    
    if (!_cellHeight) {
        // 顶部固定H + 文字H
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - SENTopicCellMargin * 4, MAXFLOAT);
        CGFloat textH = [self.text boundingRectWithSize:maxSize
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]}
                                                context:nil].size.height;
        _cellHeight += SENTopicCellTextY + textH + SENTopicCellMargin;
        
        // + 图片H
        if (self.type == SENTopicTypePicture) {
            // 算好显示时的frame，显示cell时用
            
            CGFloat pictureW = maxSize.width;
            CGFloat pictureH = pictureW * self.height / self.width;
            
            // 控制大图片的显示范围
            if (pictureH >= SENTopicCellPictureMaxH) {
                pictureH = SENTopicCellPictureFixedH;
                self.bigPicture = YES;
            }
            
            CGFloat pictureX = SENTopicCellMargin;
            CGFloat pictureY = SENTopicCellTextY + textH +SENTopicCellMargin;
            
            _pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            _cellHeight += pictureH +SENTopicCellMargin;
        } else if (self.type == SENTopicTypeVoice){
            
        }
        
        // + 底部固定H
        _cellHeight += SENTopicCellBottomBarH + SENTopicCellMargin;
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
