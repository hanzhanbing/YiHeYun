//
//  LongSitRemindSetVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "LongSitRemindSetVC.h"
#import "SelectTimeView.h"

@interface LongSitRemindSetVC ()
{
    SelectTimeView *selectTimeView;
    UIButton *bgButton;
    BOOL isStart;
}
@end

@implementation LongSitRemindSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"久坐提醒";
    [self initView];
}
- (void)initView{
    __weak LongSitRemindSetVC *weakSelf = self;


    bgButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    bgButton.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    [bgButton addTarget:self action:@selector(hiddenAllView) forControlEvents:UIControlEventTouchUpInside];
    bgButton.alpha = 0.0;
    bgButton.hidden = YES;
    [self.view addSubview:bgButton];


    selectTimeView = [[SelectTimeView alloc]initWithFrame:CGRectMake(20, 100, WIDTH-40, 200) WithSingSlect:YES];
    selectTimeView.cornerRadius = 4;
    selectTimeView.y = HEIGHT;
    selectTimeView.hidden = YES;
    selectTimeView.sureSlect = ^(NSString *time1,NSString *time2){
        [weakSelf hiddenAllView];
        if (isStart) {
            weakSelf.startTimeLB.text = [NSString stringWithFormat:@"%@:%@",time1,time2];
            weakSelf.startTimeLB.text  = [ weakSelf.startTimeLB.text stringByReplacingOccurrencesOfString:@"点" withString:@""];
            weakSelf.startTimeLB.text  = [ weakSelf.startTimeLB.text stringByReplacingOccurrencesOfString:@"分" withString:@""];
        }else{
            weakSelf.endTimeLB.text = [NSString stringWithFormat:@"%@:%@",time1,time2];
            weakSelf.endTimeLB.text  = [ weakSelf.endTimeLB.text stringByReplacingOccurrencesOfString:@"点" withString:@""];
            weakSelf.endTimeLB.text  = [ weakSelf.endTimeLB.text stringByReplacingOccurrencesOfString:@"分" withString:@""];
        }

    };
    selectTimeView.cancleSlect = ^(){
        [weakSelf hiddenAllView];
    };
    [self.view addSubview:selectTimeView];

}

- (void)hiddenAllView{
    [UIView animateWithDuration:0.2 animations:^{
        //        stupView.y = HEIGHT;
        selectTimeView.y = HEIGHT;
        bgButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        bgButton.hidden = YES;;
        //        stupView.hidden = YES;
        selectTimeView.hidden = YES;
    }];
}




- (IBAction)remindTimeAction:(id)sender{
    selectTimeView.hidden = NO;
    bgButton.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        selectTimeView.y = HEIGHT/2.0-255/2.0;
        bgButton.alpha = 1.0;
    }];
    
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

- (IBAction)switchTouchAction:(UISwitch *)sender {
}

- (IBAction)startTimeAction:(id)sender {
    isStart = YES;
    selectTimeView.hidden = NO;
    bgButton.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        selectTimeView.y = HEIGHT/2.0-255/2.0;
        bgButton.alpha = 1.0;
    }];
}

- (IBAction)endTimeAction:(id)sender {
    isStart = NO;
    selectTimeView.hidden = NO;
    bgButton.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        selectTimeView.y = HEIGHT/2.0-255/2.0;
        bgButton.alpha = 1.0;
    }];
}
- (IBAction)addSetAction:(id)sender {
}
@end
