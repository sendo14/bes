//
//  SENTopicCell.m
//  百思不得姐SEN
//
//  Created by sendo on 17/1/10.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import "SENTopicCell.h"
#import "SENTopic.h"
#import <UIImageView+WebCache.h>

@interface SENTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;


@end

@implementation SENTopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setTopic:(SENTopic *)topic{
    _topic = topic;
    
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topic.name;
    self.creatTimeLabel.text = topic.create_time;
}

- (void)setFrame:(CGRect)frame{
    static CGFloat margin = 10;
    
    frame.size.width -= margin * 2;
    frame.size.height -= margin;
    frame.origin.x = margin;
    frame.origin.y += margin;
    
    [super setFrame:frame];
}


@end
