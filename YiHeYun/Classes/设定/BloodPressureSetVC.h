//
//  BloodPressureSetVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface BloodPressureSetVC : BaseVC


- (IBAction)switchTouchAction:(id)sender;
- (IBAction)selectBloodPressure1Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showPrssureLB1;
- (IBAction)selectBloodPressure2Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showPrssureLB2;

- (IBAction)SaveDataAction:(id)sender;


@end
