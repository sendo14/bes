//
//  UIView+SENExtension.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/20.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "UIView+SENExtension.h"

@implementation UIView (SENExtension)

// setter


- (void)setSen_size:(CGSize)sen_size{
    CGRect frame = self.frame;
    frame.size = sen_size;
    self.frame = frame;
}

- (void)setSen_width:(CGFloat)sen_width{
    CGRect frame = self.frame;
    frame.size.width = sen_width;
    self.frame = frame;
}

- (void)setSen_height:(CGFloat)sen_height{
    CGRect frame = self.frame;
    frame.size.height = sen_height;
    self.frame = frame;
}

- (void)setSen_x:(CGFloat)sen_x{
    CGRect frame = self.frame;
    frame.origin.x = sen_x;
    self.frame = frame;
}

- (void)setSen_y:(CGFloat)sen_y{
    CGRect frame = self.frame;
    frame.origin.y = sen_y;
    self.frame = frame;
}

- (void)setSen_centerX:(CGFloat)sen_centerX{
    CGPoint center = self.center;
    center.x = sen_centerX;
    self.center = center;
}

- (void)setSen_centerY:(CGFloat)sen_centerY{
    CGPoint center = self.center;
    center.y = sen_centerY;
    self.center = center;
}


// getter

- (CGSize)sen_size{
    return self.frame.size;
}

- (CGFloat)sen_width{
    return self.frame.size.width;
}

- (CGFloat)sen_height{
    return self.frame.size.height;
}

- (CGFloat)sen_x{
    return self.frame.origin.x;
}

- (CGFloat)sen_y{
    return self.frame.origin.y;
}

- (CGFloat)sen_centerX{
    return self.center.x;
}

- (CGFloat)sen_centerY{
    return self.center.y;
}






@end
