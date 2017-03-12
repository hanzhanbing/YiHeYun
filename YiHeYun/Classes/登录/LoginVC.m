//
//  LoginVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登录";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)forgetPswAction:(id)sender {
}

- (IBAction)loginAction:(id)sender {
    
    NSLog(@"hdjfgjreg%@",[[Utils md5HexDigest:[[Utils md5HexDigest:_psWTF.text] uppercaseString]] uppercaseString]);
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         _accountTF.text, @"loginName",
                         [[Utils md5HexDigest:[[Utils md5HexDigest:_psWTF.text] uppercaseString]] uppercaseString], @"password",
                         nil];
    [[NetworkManager sharedManager] postJSON:URL_Login parameters:dic imagePath:nil completion:^(id responseData, RequestState status, NSError *error) {
        
        if (status == Request_Success) {
            [Utils showToast:@"登录成功"];
            
            [[UserInfo share] setUserInfo:responseData];
        } else {
            [Utils showToast:@"登录失败"];
        }
    }];
}

@end
