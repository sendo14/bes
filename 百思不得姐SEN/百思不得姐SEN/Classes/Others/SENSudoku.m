//
//  SENSudoku.m
//  百思不得姐SEN
//
//  Created by sendo on 16/12/23.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENSudoku.h"
#import "SENVerticalButton.h"

@implementation SENSudoku

/**
 * 核心思路：
 * 列的x值一样,行的y值一样
 * x值＝列号 *（子控件宽＋列间距），y值＝行号 *（子控件高＋行间距）
 * 列号＝index％列数,行号＝index／列数    ----计算时依靠固定列数
 */

// 按钮添加
+ (void)sudokuWithItem:(UIView *)item width:(CGFloat)width height:(CGFloat)height column:(NSUInteger)column line:(NSUInteger)line inTheSuperView:(UIView *)theSuperView{
    
    // 预定义
    CGFloat itemW = width;
    CGFloat itemH = height;
    NSUInteger cols = column;
    NSUInteger lines = line;
    
    // 间距计算
    CGFloat colMargin = (theSuperView.frame.size.width - cols * itemW)/(cols - 1);
    CGFloat rowMargin = (theSuperView.frame.size.height - lines * itemH)/(lines - 1);
    
    // 父控件中已经添加的子控件个数
    NSUInteger index = theSuperView.subviews.count;
    
    // x、y值计算（位置）
    NSUInteger col = index % cols;
    NSUInteger row = index / cols;
    
    CGFloat itemX = col * (itemW + colMargin);
    CGFloat itemY = row * (itemH + rowMargin);
    
    // 设置要添加控件的位置

    item.frame = CGRectMake(itemX, itemY, itemW, itemH);
    [theSuperView addSubview:item];

}


// 直接布局
+ (void)sudokuWithImageArray:(NSArray *)imageArray
                  titleArray:(NSArray *)titleArray
                       width:(CGFloat)itemW
                      height:(CGFloat)itemH
                      startX:(CGFloat)startX
                      column:(NSUInteger)column
                      line:(NSUInteger)line
              inTheSuperView:(UIView *)theSuperView{
    
//    CGFloat buttonStartY = (theSuperView.bounds.size.height - line * itemH) * 0.5;
    CGFloat xMargin = (theSuperView.bounds.size.width - 2 * startX - column * itemW) / (column - 1);
    CGFloat yMargin = (theSuperView.bounds.size.height - line * itemH) / (line - 1);
//    CGFloat colMargin = (theSuperView.frame.size.width - column * itemW)/(column - 1);
//    CGFloat rowMargin = (theSuperView.frame.size.height - line * itemH)/(line - 1);
    
    for (int i = 0; i<imageArray.count; i++) {
        SENVerticalButton *button = [[SENVerticalButton alloc] init];
        // 设置内容
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        
        // 设置frame
        button.width = itemW;
        button.height = itemH;
        int row = i / column;
        int col = i % column;
        
        button.x = startX + col * (itemW + xMargin);
        button.y = row * (itemH + yMargin);

        [theSuperView addSubview:button];
    }
}
@end
