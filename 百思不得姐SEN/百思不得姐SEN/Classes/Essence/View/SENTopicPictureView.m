//
//  SENTopicPictureView.m
//  百思不得姐SEN
//
//  Created by sendo on 17/2/3.
//  Copyright © 2017年 sendo. All rights reserved.
//

#import "SENTopicPictureView.h"
#import "SENM13ProgressViewRing.h"
#import "SENTopic.h"
#import "SENShowPictureViewController.h"

#import <UIImageView+WebCache.h>


@interface SENTopicPictureView()
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigBtn;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet SENM13ProgressViewRing *progressView;


@end

@implementation SENTopicPictureView

+ (instancetype)pictureView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;

    self.pictureView.userInteractionEnabled = YES;
    [self.pictureView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)]];
}

- (void)showPicture{
    SENShowPictureViewController *showPicture = [[SENShowPictureViewController alloc] init];
    showPicture.topic = self.topic;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPicture animated:YES completion:nil];
}

- (void)setTopic:(SENTopic *)topic{
    
    _topic = topic;
    
    // 马上显示最新进度值
    [self.progressView setProgress:topic.pictureProgress animated:NO];
    
    // 设置图片显示
    [self.pictureView sd_setImageWithURL:[NSURL URLWithString:topic.pictureL_URL]
                        placeholderImage:nil
                                 options:0
                                progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                    self.progressView.hidden = NO;
                                    topic.pictureProgress = 1.0 * receivedSize / expectedSize;
                                    [self.progressView setProgress:topic.pictureProgress animated:NO];
    }
                               completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                   self.progressView.hidden = YES;
                                   if (topic.isBigPicture == NO) return;
                                   
                                   // 绘制大图
                                   UIGraphicsBeginImageContextWithOptions(topic.pictureFrame.size, YES, 0.0);
                                   
                                   CGFloat width = topic.pictureFrame.size.width;
                                   CGFloat height = width * image.size.height / image.size.width;
                                   [image drawInRect:CGRectMake(0, 0, width, height)];
                                   
                                   self.pictureView.image = UIGraphicsGetImageFromCurrentImageContext();
                                   
                                   UIGraphicsEndImageContext();
    }];
    
    
    // 判断是否GIF
    NSString *extension = topic.pictureL_URL.pathExtension;
    self.gifView.hidden = ![extension.lowercaseString isEqualToString:@"gif"];
    
    // 判断大图按钮显示
    if (topic.isBigPicture) {
        self.seeBigBtn.hidden = NO;
    } else {
        self.seeBigBtn.hidden = YES;
    }
}

@end
