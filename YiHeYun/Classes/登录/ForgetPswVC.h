//
//  ForgetPswVC.h
//  YiHeYun
//
//  Created by zyl on 17/3/12.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface ForgetPswVC : BaseVC

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *phoneTF;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *codeTF;

- (IBAction)getCodeAction:(id)sender;

@end
