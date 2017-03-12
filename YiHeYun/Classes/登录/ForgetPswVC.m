
//
//  ForgetPswVC.m
//  YiHeYun
//
//  Created by zyl on 17/3/12.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "ForgetPswVC.h"

@interface ForgetPswVC ()

@end

@implementation ForgetPswVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"验证手机";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *vc = segue.destinationViewController;
    vc.hidesBottomBarWhenPushed = YES;
    
    NSString *identifier = segue.identifier;
    if ([identifier isEqualToString:@"SetPsw"]) { //设置密码
        NSLog(@"跳转到设置密码");
    }
    if ([identifier isEqualToString:@"Register"]) { //注册
        NSLog(@"跳转到注册");
    }
}

- (IBAction)getCodeAction:(id)sender {
}

@end
