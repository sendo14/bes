//
//  SENTestViewViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/12/23.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENTestViewViewController.h"
#import "SENSudoku.h"
#import "SENVerticalButton.h"

@interface SENTestViewViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation SENTestViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.btn = [[UIButton alloc] init];
//    self.btn.backgroundColor = [UIColor yellowColor];
    self.imageArray = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    self.titleArray = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    

    [SENSudoku sudokuWithImageArray:self.imageArray
                         titleArray:self.titleArray
                              width:60
                             height:90
                             startX:20
                             column:3
                               line:2
                     inTheSuperView:_testView];

}

- (IBAction)testButton:(id)sender {
    // 测试在SENMeViewController，点击月亮图标
//    [SENSudoku sudokuWithItem:self.btn width:65 height:75 column:5 line:4 inTheSuperView:_testView];
}


@end
