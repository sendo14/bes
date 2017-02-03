//
//  SENTopicCell.m
//  百思不得姐SEN
//
//  Created by sendo on 17/1/10.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import "SENTopicCell.h"
#import "SENTopic.h"
#import "SENTopicPictureView.h"

#import <UIImageView+WebCache.h>

@interface SENTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;

@property (weak, nonatomic) IBOutlet UIImageView *sinaV;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (nonatomic, weak) SENTopicPictureView *pictureView;

@end

@implementation SENTopicCell

- (SENTopicPictureView *)pictureView{
    if (! _pictureView) {
        SENTopicPictureView *pictureView = [SENTopicPictureView pictureView];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
    }
    return _pictureView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setTopic:(SENTopic *)topic{
    _topic = topic;
    
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topic.name;
    self.creatTimeLabel.text = topic.create_time;
    self.sinaV.hidden = !topic.isSina_v;
    
    self.contentLabel.text = topic.text;
    
    [self setupButtonNumber:self.dingBtn count:topic.ding defaultTitle:@"顶"];
    [self setupButtonNumber:self.caiBtn count:topic.cai defaultTitle:@"踩"];
    [self setupButtonNumber:self.repostBtn count:topic.repost defaultTitle:@"分享"];
    [self setupButtonNumber:self.commentBtn count:topic.comment defaultTitle:@"评论"];
    
    // 添加不同类型帖子到cell中间
    if (topic.type == SENTopicTypePicture) {
        self.pictureView.topic = topic;
        self.pictureView.frame = topic.pictureFrame;
        
    } else if (topic.type == SENTopicTypeVoice){
        
    }
    
}

- (void)setupButtonNumber:(UIButton *)button count:(NSInteger)count defaultTitle:(NSString *)defaultTitle{
    // 三种情况：大于1万、0、其它
    if (count > 10000) {
        defaultTitle = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else if (count > 0) {
        defaultTitle = [NSString stringWithFormat:@"%zd", count];
    }
    
    [button setTitle:defaultTitle forState:UIControlStateNormal];
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
