//
//  SENVerticalButton.m
//  百思不得姐SEN
//
//  Created by sendo on 16/12/5.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENVerticalButton.h"

@implementation SENVerticalButton

- (void)setup{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib{
    [self setup];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.sen_x = 0;
    self.imageView.sen_y = 0;
    self.imageView.sen_width = self.sen_width;
    self.imageView.sen_height = self.imageView.sen_width;
    
    self.titleLabel.sen_x = 0;
    self.titleLabel.sen_y = self.imageView.sen_height;
    self.titleLabel.sen_width = self.sen_width;
    self.titleLabel.sen_height = self.sen_height - self.imageView.sen_height;
}

#warning 这三个方法什么时候调用？

@end
