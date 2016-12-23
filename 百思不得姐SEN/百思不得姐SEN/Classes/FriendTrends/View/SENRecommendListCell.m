//
//  SENRecommendListCell.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/25.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENRecommendListCell.h"
#import "SENRecommendList.h"

@interface SENRecommendListCell()

@property (weak, nonatomic) IBOutlet UIView *selectedView;

@end

@implementation SENRecommendListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = SENRGBColor(244, 244, 244);
    self.selectedView.backgroundColor = SENRGBColor(219, 21, 26);
//    self.textLabel.textColor = SENRGBColor(78, 78, 78);
//    self.textLabel.highlightedTextColor = SENRGBColor(219, 21, 26);
}

- (void)setList:(SENRecommendList *)list{
    _list = list;
    
    self.textLabel.text = list.name;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    self.selectedView.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedView.backgroundColor : SENRGBColor(78, 78, 78);
}

@end
