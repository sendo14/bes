//
//  SENSudoku.m
//  百思不得姐SEN
//
//  Created by sendo on 16/12/23.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENSudoku.h"

@implementation SENSudoku

/**
 * 核心思路：
 * 列的x值一样,行的y值一样
 * x值＝列号 *（子控件宽＋列间距），y值＝行号 *（子控件高＋行间距）
 * 列号＝index％列数,行号＝index／列数    ----计算时依靠固定列数
 */
+ (void)sudokuWithColumn:(NSUInteger)column line:(NSUInteger)line width:(CGFloat)width height:(CGFloat)height atTheSuperView:(UIView *)theSuperView{
    
    // 预定义
    CGFloat objectW = width;
    CGFloat objectH = height;
    NSUInteger cols = column;
    NSUInteger lines = line;
    
    // margin计算
    CGFloat colMargin = (theSuperView.frame.size.width - cols * objectW)/(cols - 1);
    CGFloat rowMargin = (theSuperView.frame.size.height - lines * objectH)/(lines - 1);
    
    // 父控件中已经添加的子控件个数
    NSUInteger index = theSuperView.subviews.count;
    
    // x、y值计算（位置）
    NSUInteger col = index % cols;
    NSUInteger row = index / cols;
    
    CGFloat objectX = col * (objectW + colMargin);
    CGFloat objectY = row * (objectH + rowMargin);
    
    // 创建要添加的控件
    UIView *objectView = [[UIView alloc] init];
    objectView.backgroundColor = [UIColor yellowColor];
    objectView.frame = CGRectMake(objectX, objectY, objectW, objectH);
    [theSuperView addSubview:objectView];
    
    theSuperView.clipsToBounds = YES;
}
@end
