//
//  UIBarButtonItem+SENExtension.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/20.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "UIBarButtonItem+SENExtension.h"

@implementation UIBarButtonItem (SENExtension)

+ (instancetype)itemwith:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [Button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    Button.size = Button.currentBackgroundImage.size;
    [Button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:Button];
}

@end
