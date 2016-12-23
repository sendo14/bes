//
//  SENTestViewViewController.m
//  百思不得姐SEN
//
//  Created by sendo on 16/12/23.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENTestViewViewController.h"
#import "SENSudoku.h"

@interface SENTestViewViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation SENTestViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)testButton:(id)sender {
    // 测试在SENMeViewController，点击月亮图标
    [SENSudoku sudokuWithColumn:5 line:4 width:40 height:60 atTheSuperView:_testView];
}


@end
