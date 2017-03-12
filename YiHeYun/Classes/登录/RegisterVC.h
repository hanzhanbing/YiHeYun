//
//  RegisterVC.h
//  YiHeYun
//
//  Created by zyl on 17/3/12.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface RegisterVC : BaseVC

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *pswTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;

- (IBAction)getCodeAction:(id)sender;
- (IBAction)registerProtocolAction:(id)sender;
- (IBAction)registerAction:(id)sender;


@end
