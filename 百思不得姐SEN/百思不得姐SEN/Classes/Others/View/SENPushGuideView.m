//
//  SENPushGuideView.m
//  百思不得姐SEN
//
//  Created by sendo on 16/12/6.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENPushGuideView.h"

@implementation SENPushGuideView

+ (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    NSString *key = @"CFBundleShortVersionString";
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    NSString *sandboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:sandboxVersion]) {
        SENPushGuideView *guideView = [SENPushGuideView guide];
        guideView.frame = window.bounds;
        [window addSubview:guideView];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
#warning 这里的逻辑要再弄清楚一下
}

+ (instancetype)guide{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (IBAction)closeButton:(id)sender {
    [self removeFromSuperview];
}

@end
