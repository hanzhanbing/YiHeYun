//
//  SetPswVC.h
//  YiHeYun
//
//  Created by zyl on 17/3/12.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface SetPswVC : BaseVC

@property (weak, nonatomic) IBOutlet UITextField *pswTF;
@property (weak, nonatomic) IBOutlet UITextField *confirmPswTF;

- (IBAction)submitAction:(id)sender;

@end
