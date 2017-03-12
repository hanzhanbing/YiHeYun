//
//  HeartRateSetVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "HeartRateSetVC.h"
#import "PanProgressView.h"
#import "SelectTimeView.h"

@interface HeartRateSetVC ()
{
    UIButton *bgButton;
    PanProgressView *panView1;
    SelectTimeView *selectTimeView;
}
@end

@implementation HeartRateSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"心率设置";
    [self initView];
}
- (void)initView{

    __weak HeartRateSetVC *weakSelf = self;

    bgButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    bgButton.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    [bgButton addTarget:self action:@selector(hiddenAllView) forControlEvents:UIControlEventTouchUpInside];
    bgButton.alpha = 0.0;
    bgButton.hidden = YES;
    [self.view addSubview:bgButton];



    panView1 =  [[PanProgressView alloc]initWithFrame:CGRectMake(20, 100, WIDTH-40, 240) andUnit:@"bpm"];
    panView1.title = @"心率范围";
    panView1.y = HEIGHT;
    panView1.sureSlect = ^(NSString *time1,NSString *time2){
        NSLog(@"%@  %@",time1,time2);
        weakSelf.showRateLB1.text = [NSString stringWithFormat:@"%@~%@bpm",time1,time2];
    };
    panView1.cancleSlect = ^(){
        [weakSelf hiddenAllView];
    };
    [self.view addSubview:panView1];



    selectTimeView = [[SelectTimeView alloc]initWithFrame:CGRectMake(20, 100, WIDTH-40, 255) WithSingSlect:NO];
    selectTimeView.cornerRadius = 4;
    selectTimeView.title = @"定时检测";
    selectTimeView.y = HEIGHT;
    selectTimeView.hidden = YES;
    selectTimeView.sureSlect = ^(NSString *time1,NSString *time2){
        [weakSelf hiddenAllView];
        weakSelf.showRateLB2.text = [NSString stringWithFormat:@"%@-%@",time1,time2];
    };
    selectTimeView.cancleSlect = ^(){
        [weakSelf hiddenAllView];
    };
    [self.view addSubview:selectTimeView];


    
}


- (void)hiddenAllView{
    [UIView animateWithDuration:0.2 animations:^{

        panView1.y = HEIGHT;
        selectTimeView.y = HEIGHT;
        //        selectTimeView.y = HEIGHT;
        bgButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        bgButton.hidden = YES;;

        panView1.hidden = YES;

        selectTimeView.hidden = YES;

        //        selectTimeView.hidden = YES;
    }];
}



- (IBAction)switchTouchAction:(id)sender{

}
- (IBAction)selectHeartRate1Action:(id)sender{
    panView1.hidden = NO;
    bgButton.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        panView1.y = HEIGHT/2.0-panView1.height/2.0;
        bgButton.alpha = 1.0;
    }];

}
- (IBAction)selectHeartRate2Action:(id)sender{
    selectTimeView.hidden = NO;
    bgButton.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        selectTimeView.y = HEIGHT/2.0-selectTimeView.height/2.0;
        bgButton.alpha = 1.0;
    }];

}
- (IBAction)SaveDataAction:(id)sender{

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

@end
