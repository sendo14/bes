//
//  NSDate+SENExtension.h
//  百思不得姐SEN
//
//  Created by sendo on 17/1/16.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SENExtension)

- (BOOL)isThisYear;
- (BOOL)isToday;
- (BOOL)isYesterday;

- (NSDateComponents *)gapFromDate:(NSDate *)date;

@end
