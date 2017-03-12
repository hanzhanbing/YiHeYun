//
//  BloodSugarSetVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BloodSugarSetVC.h"

#import "PanProgressView.h"

@interface BloodSugarSetVC ()
{
     UIButton *bgButton;
    PanProgressView *panView;
        PanProgressView *panView1;
        PanProgressView *panView2;
}
@end

@implementation BloodSugarSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"血糖范围设置";
    [self initView];
}

- (void)initView{


    __weak BloodSugarSetVC *weakSelf = self;

    bgButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    bgButton.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    [bgButton addTarget:self action:@selector(hiddenAllView) forControlEvents:UIControlEventTouchUpInside];
    bgButton.alpha = 0.0;
    bgButton.hidden = YES;
    [self.view addSubview:bgButton];

  panView =  [[PanProgressView alloc]initWithFrame:CGRectMake(20, 100, WIDTH-40, 240) andUnit:@"mmlo/L"];
    panView.title = @"血糖范围";
    panView.y = HEIGHT;
    panView.sureSlect = ^(NSString *time1,NSString *time2){
        NSLog(@"%@  %@",time1,time2);
        weakSelf.showSugarLB1.text = [NSString stringWithFormat:@"%@~%@mmol/L",time1,time2];
    };
    panView.cancleSlect = ^(){
        [weakSelf hiddenAllView];
    };
    [self.view addSubview:panView];



    panView1 =  [[PanProgressView alloc]initWithFrame:CGRectMake(20, 100, WIDTH-40, 240) andUnit:@"mmlo/L"];
    panView1.title = @"血糖范围";
    panView1.y = HEIGHT;
    panView1.sureSlect = ^(NSString *time1,NSString *time2){
        NSLog(@"%@  %@",time1,time2);
         weakSelf.showSugarLB2.text = [NSString stringWithFormat:@"%@~%@mmol/L",time1,time2];
    };
    panView1.cancleSlect = ^(){
  [weakSelf hiddenAllView];
    };
    [self.view addSubview:panView1];



    panView2 =  [[PanProgressView alloc]initWithFrame:CGRectMake(20, 100, WIDTH-40, 240) andUnit:@"mmlo/L"];
    panView2.title = @"血糖范围";
    panView2.y = HEIGHT;
    panView2.sureSlect = ^(NSString *time1,NSString *time2){
        NSLog(@"%@  %@",time1,time2);
         weakSelf.showSugarLB3.text = [NSString stringWithFormat:@"%@~%@mmol/L",time1,time2];
        
    };
    panView2.cancleSlect = ^(){
  [weakSelf hiddenAllView];
    };
    [self.view addSubview:panView2];


}


- (void)hiddenAllView{
    [UIView animateWithDuration:0.2 animations:^{
        panView.y = HEIGHT;
         panView1.y = HEIGHT;
         panView2.y = HEIGHT;
//        selectTimeView.y = HEIGHT;
        bgButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        bgButton.hidden = YES;;
        panView.hidden = YES;
        panView1.hidden = YES;

        panView2.hidden = YES;

//        selectTimeView.hidden = YES;
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

- (IBAction)switchTouchAction:(id)sender {
}

- (IBAction)selectBloodSugar1Action:(id)sender {
    panView.hidden = NO;
    bgButton.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        panView.y = HEIGHT/2.0-panView.height/2.0;
        bgButton.alpha = 1.0;
    }];
}


- (IBAction)selectBloodSugar2Action:(id)sender {
    panView1.hidden = NO;
    bgButton.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        panView1.y = HEIGHT/2.0-panView1.height/2.0;
        bgButton.alpha = 1.0;
    }];
}


- (IBAction)selectBloodSugar3Action:(id)sender {
    panView2.hidden = NO;
    bgButton.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        panView2.y = HEIGHT/2.0-panView2.height/2.0;
        bgButton.alpha = 1.0;
    }];
}

- (IBAction)SaveDataAction:(id)sender {
}
@end
