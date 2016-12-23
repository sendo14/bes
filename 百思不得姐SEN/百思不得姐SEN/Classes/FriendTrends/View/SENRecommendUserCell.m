//
//  SENRecommendUserCell.m
//  百思不得姐SEN
//
//  Created by sendo on 16/11/27.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENRecommendUserCell.h"
#import "SENRecommendUser.h"

// pods
#import "UIImageView+WebCache.h"

@interface SENRecommendUserCell()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;


@end

@implementation SENRecommendUserCell

- (void)setUser:(SENRecommendUser *)user{
    _user = user;
    
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.screenNameLabel.text = user.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%zd人关注", user.fans_count];
    
    #warning 头像变圆形
    self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.width / 2;
    self.headerImageView.clipsToBounds = YES;

}

@end
