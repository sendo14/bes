//
//  NSDate+SENExtension.m
//  百思不得姐SEN
//
//  Created by sendo on 17/1/16.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import "NSDate+SENExtension.h"

@implementation NSDate (SENExtension)

- (BOOL)isThisYear{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger creatYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == creatYear;
}

- (BOOL)isToday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *creatCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == creatCmps.year
    && nowCmps.month == creatCmps.month
    && nowCmps.day == creatCmps.day;
}

- (BOOL)isYesterday{
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
#warning 为什么要转两次？
    NSDate *creatDate = [fmt dateFromString:[fmt stringFromDate:self]];
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit
                                         fromDate:creatDate
                                           toDate:nowDate
                                          options:0];
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}

- (NSDateComponents *)gapFromDate:(NSDate *)date{
    
    // 比较传进来的时间(creatTime)和调用者(now)的时间组成的差值
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit
                       fromDate:date
                         toDate:self
                        options:0];
}

@end
