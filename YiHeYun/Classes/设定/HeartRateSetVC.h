//
//  HeartRateSetVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface HeartRateSetVC : BaseVC

- (IBAction)switchTouchAction:(id)sender;
- (IBAction)selectHeartRate1Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showRateLB1;
- (IBAction)selectHeartRate2Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showRateLB2;

- (IBAction)SaveDataAction:(id)sender;



@end
