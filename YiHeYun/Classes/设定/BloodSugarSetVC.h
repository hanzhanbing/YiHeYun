//
//  BloodSugarSetVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface BloodSugarSetVC : BaseVC
- (IBAction)switchTouchAction:(id)sender;
- (IBAction)selectBloodSugar1Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showSugarLB1;
- (IBAction)selectBloodSugar2Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showSugarLB2;
- (IBAction)selectBloodSugar3Action:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showSugarLB3;
- (IBAction)SaveDataAction:(id)sender;

@end
