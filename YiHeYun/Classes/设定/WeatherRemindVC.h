//
//  WeatherRemindVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface WeatherRemindVC : BaseVC


- (IBAction)switchTouchAction:(UISwitch *)sender;
- (IBAction)remindTimeAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *dayTimeLB;

- (IBAction)addSetAction:(id)sender;


@end
