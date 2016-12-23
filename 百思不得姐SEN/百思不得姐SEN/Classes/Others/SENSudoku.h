//
//  SENSudoku.h
//  百思不得姐SEN
//
//  Created by sendo on 16/12/23.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SENSudoku : NSObject

+ (void)sudokuWithColumn:(NSUInteger)column line:(NSUInteger)line width:(CGFloat)width height:(CGFloat)height atTheSuperView:(UIView *)theSuperView;
@end
