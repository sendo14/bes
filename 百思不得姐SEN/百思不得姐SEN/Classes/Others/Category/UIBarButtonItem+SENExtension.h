//
//  UIBarButtonItem+SENExtension.h
//  百思不得姐SEN
//
//  Created by sendo on 16/11/20.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SENExtension)
+ (instancetype)itemwith:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
