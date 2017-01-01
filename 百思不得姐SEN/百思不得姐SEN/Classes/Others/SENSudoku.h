//
//  SENSudoku.h
//  百思不得姐SEN
//
//  Created by sendo on 16/12/23.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SENSudoku : NSObject

+ (void)sudokuWithItem:(UIView *)item width:(CGFloat)width height:(CGFloat)height column:(NSUInteger)column line:(NSUInteger)line inTheSuperView:(UIView *)theSuperView;

+ (void)sudokuWithImageArray:(NSArray *)imageArray
                  titleArray:(NSArray *)titleArray
                       width:(CGFloat)itemW
                      height:(CGFloat)itemH
                      startX:(CGFloat)startX
                      column:(NSUInteger)column
                        line:(NSUInteger)line
              inTheSuperView:(UIView *)theSuperView;
@end
