//
//  LongSitRemindSetVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface LongSitRemindSetVC : BaseVC
- (IBAction)switchTouchAction:(UISwitch *)sender;
- (IBAction)startTimeAction:(id)sender;
- (IBAction)endTimeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLB;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLB;
- (IBAction)addSetAction:(id)sender;

@end
