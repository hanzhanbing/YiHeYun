//
//  SetUpVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "SetUpVC.h"



@interface SetUpVC ()

@end

@implementation SetUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    _bgScrollView.contentSize = CGSizeMake(0, MAX(_bgScrollView.height, _bottomView.maxY+10));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
 */

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *vc = segue.destinationViewController;
    vc.hidesBottomBarWhenPushed = YES;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)engCallAction:(UIButton *)sender {
}

- (IBAction)yiJianCallAction:(UIButton *)sender {
}

- (IBAction)setRemindAction:(id)sender {
}

- (IBAction)longSitRemindAction:(id)sender {
}

- (IBAction)elecFenceAction:(id)sender {
}

- (IBAction)WeatherForcastAction:(id)sender {
}

- (IBAction)heartRateAction:(id)sender {
}

- (IBAction)StepCounterAction:(id)sender {
}

- (IBAction)bloodSugarAction:(id)sender {
}

- (IBAction)bloodPressureAction:(id)sender {
}
@end
