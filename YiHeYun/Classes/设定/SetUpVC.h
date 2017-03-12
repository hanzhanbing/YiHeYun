//
//  SetUpVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface SetUpVC : BaseVC
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
- (IBAction)engCallAction:(UIButton *)sender;
- (IBAction)yiJianCallAction:(UIButton *)sender;
- (IBAction)setRemindAction:(id)sender;
- (IBAction)longSitRemindAction:(id)sender;
- (IBAction)elecFenceAction:(id)sender;
- (IBAction)WeatherForcastAction:(id)sender;
- (IBAction)heartRateAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
- (IBAction)StepCounterAction:(id)sender;
- (IBAction)bloodSugarAction:(id)sender;
- (IBAction)bloodPressureAction:(id)sender;

@end
