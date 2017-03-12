//
//  PanProgressView.m
//  selectTime
//
//  Created by mac on 2017/3/10.
//  Copyright © 2017年 zrgg. All rights reserved.
//

#import "PanProgressView.h"

@interface PanProgressView()
{
    UILabel *titleLB;
    NSString *_unit;
    UISlider *sliderView1;
      UISlider *sliderView2;
    UILabel *upLB;
    UILabel *downLB;
    NSString *maxValue;
    NSString *minValue;
}

@end

@implementation PanProgressView

- (void)setTitle:(NSString *)title{
    titleLB.text = title;
}

- (id)initWithFrame:(CGRect)frame andUnit:(NSString *)unit{
    self = [super initWithFrame:frame];
    if (self) {
        _unit = unit;
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    titleLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.backgroundColor = [UIColor purpleColor];
    titleLB.textColor = [UIColor whiteColor];
    [self addSubview:titleLB];


    upLB = [[UILabel alloc]initWithFrame:CGRectMake(30, 60, self.frame.size.width-60, 20)];
    upLB.textAlignment = NSTextAlignmentCenter;

    upLB.textColor = [UIColor purpleColor];
    upLB.text = [NSString stringWithFormat:@"上限0%@",_unit];
    upLB.font = [UIFont systemFontOfSize:13];
    [self addSubview:upLB];

    sliderView1 = [[UISlider alloc]initWithFrame:CGRectMake(30, 90, self.frame.size.width-60, 20)];
    sliderView1.tintColor = [UIColor purpleColor];
    sliderView1.maximumValue = 1000;
    sliderView1.minimumValue = 100;
//    sliderView1.thumbTintColor = [UIColor redColor];
    sliderView1.minimumTrackTintColor = [UIColor purpleColor];
    sliderView1.maximumTrackTintColor = [UIColor colorWithRed:175/255.0 green:105/255.0 blue:199/255.0 alpha:1.0];
    [self addSubview:sliderView1];
    [sliderView1 addTarget:self action:@selector(setValue1:) forControlEvents:UIControlEventAllEvents];



    downLB = [[UILabel alloc]initWithFrame:CGRectMake(30, 130, self.frame.size.width-60, 20)];
    downLB.textAlignment = NSTextAlignmentCenter;
//    downLB.backgroundColor = [UIColor purpleColor];
    downLB.textColor = [UIColor purpleColor];
    downLB.font = [UIFont systemFontOfSize:13];
    downLB.text = [NSString stringWithFormat:@"下限0%@",_unit];
    [self addSubview:downLB];

    sliderView2 = [[UISlider alloc]initWithFrame:CGRectMake(30, 150, self.frame.size.width-60, 20)];
    sliderView2.tintColor = [UIColor purpleColor];
    sliderView2.maximumValue = 1000;
    [sliderView2 addTarget:self action:@selector(setValue1:) forControlEvents:UIControlEventAllEvents];
    sliderView2.minimumValue = 100;
    sliderView2.maximumTrackTintColor = [UIColor colorWithRed:175/255.0 green:105/255.0 blue:199/255.0 alpha:1.0];
    [self addSubview:sliderView2];

    UIView *bggView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width, 40)];
    bggView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
    [self addSubview:bggView];

    UIButton *cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width/2.0, 40)];
    [cancleBtn setTitle:@"取消" forState:0];
    [cancleBtn setTitleColor:[UIColor darkGrayColor] forState:0];
    [cancleBtn addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    cancleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:cancleBtn];

    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, self.frame.size.height-40, self.frame.size.width/2.0, 40)];
    [sureBtn setTitle:@"确定" forState:0];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [sureBtn setTitleColor:AppThemeColor forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sureBtn];

    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, sureBtn.center.y-10, 1, 20)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line1];
    


    

}

- (void)cancle{
    if (_cancleSlect) {
        _cancleSlect();
    }
}

- (void)sure{
    if ([minValue integerValue]>[maxValue integerValue]) {
        return;
    }
    if (_sureSlect) {
        _sureSlect(minValue,maxValue);
    }
    if (_cancleSlect) {
        _cancleSlect();
    }

    
}

- (void)setValue1:(UISlider *)sender{
    if ([sender isEqual:sliderView1]) {
        minValue = [NSString stringWithFormat:@"%d",(int)sliderView1.value];
   upLB.text = [NSString stringWithFormat:@"上限%d%@",(int)sliderView1.value,_unit];
    }else{
    maxValue = [NSString stringWithFormat:@"%d",(int)sliderView2.value];
    downLB.text = [NSString stringWithFormat:@"下限%d%@",(int)sliderView2.value,_unit];
    }
}

@end
