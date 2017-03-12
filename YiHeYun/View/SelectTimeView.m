//
//  SelectTimeView.m
//  selectTime
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 zrgg. All rights reserved.
//

#import "SelectTimeView.h"

@interface SelectTimeView()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIView *bgView;
    UIPickerView *pickHourView1;
    UIPickerView *pickHourView2;

    UIPickerView *pickMinuView1;
    UIPickerView *pickMinuView2;

    NSMutableArray *dataSource;
    NSInteger minIndex;
    CGRect viewFrame;
    UILabel *titleLB;
    UILabel *countLB;
    NSString *time1;
    NSString *time2;
    BOOL isShowTwo;
}
@end

@implementation SelectTimeView

-(void)setTitle:(NSString *)title{
    titleLB.text = title;
}

- (id)initWithFrame:(CGRect)frame WithSingSlect:(BOOL)showSingle{
    self = [super initWithFrame:frame];
    if (self) {
         minIndex = 0;
        viewFrame = frame;
        isShowTwo = !showSingle;
        if (showSingle==NO) {
            [self initTimeView];
        }else{
            [self initSingleTimeView];
        }
    }
    return self;
}

- (void)initSingleTimeView{
      dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 2; i ++) {
        NSMutableArray *tempArr = [NSMutableArray array];
        if (i==0||i==2) {
            for (NSInteger j = 0; j < 24; j++) {
                NSString *str = [NSString stringWithFormat:@"%02ld点",(long)j];
                [tempArr addObject:str];
            }
        }else{
            for (NSInteger j = 0; j < 60; j++) {
                NSString *str = [NSString stringWithFormat:@"%02ld分",(long)j];
                [tempArr addObject:str];
            }
        }
        [dataSource addObject:tempArr];
    }


    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLB.frame), CGRectGetWidth(viewFrame),CGRectGetHeight(viewFrame)-CGRectGetMaxY(titleLB.frame))];
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];

    CGFloat maxY = 0;

    pickHourView1 = [[UIPickerView alloc]initWithFrame:CGRectMake(10, maxY, 10+(self.frame.size.width-20)/2.0, 150)];
    pickHourView1.delegate = self;
    pickHourView1.dataSource = self;
    pickHourView1.tag = 1;
    [bgView addSubview:pickHourView1];


    UILabel *lb1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pickHourView1.frame),  pickHourView1.center.y-15, 15, 30)];
    lb1.textColor = [UIColor blackColor];
    lb1.text = @":";
    [bgView addSubview:lb1];

    pickMinuView1 = [[UIPickerView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pickHourView1.frame), maxY, CGRectGetWidth(pickHourView1.frame), 150)];
    pickMinuView1.delegate = self;
    pickMinuView1.dataSource = self;
    pickMinuView1.tag = 2;
    [bgView addSubview:pickMinuView1];



    UIView *bggView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width, 40)];
    bggView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
    [bgView addSubview:bggView];

    UIButton *cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width/2.0, 40)];
    [cancleBtn setTitle:@"取消" forState:0];
    [cancleBtn setTitleColor:[UIColor darkGrayColor] forState:0];
    [cancleBtn addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    cancleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:cancleBtn];

    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, self.frame.size.height-40, self.frame.size.width/2.0, 40)];
    [sureBtn setTitle:@"确定" forState:0];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [sureBtn setTitleColor:SureButtonTitleColor forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:sureBtn];

    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, sureBtn.centerY-10, 1, 20)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [bgView addSubview:line1];


}

- (void)initTimeView{
    dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 4; i ++) {
        NSMutableArray *tempArr = [NSMutableArray array];
        if (i==0||i==2) {
            for (NSInteger j = 0; j < 24; j++) {
                NSString *str = [NSString stringWithFormat:@"%02ld",(long)j];
                [tempArr addObject:str];
            }
        }else{
            for (NSInteger j = 0; j < 60; j++) {
                NSString *str = [NSString stringWithFormat:@"%02ld",(long)j];
                [tempArr addObject:str];
            }
        }
        [dataSource addObject:tempArr];
    }


    titleLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.backgroundColor = [UIColor purpleColor];
    titleLB.textColor = [UIColor whiteColor];
    [self addSubview:titleLB];







    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLB.frame), CGRectGetWidth(viewFrame),CGRectGetHeight(viewFrame)-CGRectGetMaxY(titleLB.frame))];
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];


    UILabel *startTLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, (bgView.frame.size.width-10*2)/2, 20)];
    startTLB.text = @"开始时间";
    startTLB.textAlignment = NSTextAlignmentCenter;
    startTLB.textColor = [UIColor darkGrayColor];
    startTLB.font = [UIFont systemFontOfSize:13];
    [bgView addSubview:startTLB];

    UILabel *endTLB = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(startTLB.frame),10, (bgView.frame.size.width-10*2)/2, 20)];
    endTLB.text = @"结束时间";
    endTLB.textAlignment = NSTextAlignmentCenter;
    endTLB.textColor = [UIColor darkGrayColor];
    endTLB.font = [UIFont systemFontOfSize:13];
    [bgView addSubview:endTLB];


    CGFloat maxY = 20;

    pickHourView1 = [[UIPickerView alloc]initWithFrame:CGRectMake(10, maxY, (bgView.frame.size.width-10*2-30)/4, 120)];
    pickHourView1.delegate = self;
    pickHourView1.dataSource = self;
    pickHourView1.tag = 1;
    [bgView addSubview:pickHourView1];


    UILabel *lb1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pickHourView1.frame),  pickHourView1.center.y-15, 15, 30)];
    lb1.textColor = [UIColor blackColor];
    lb1.text = @":";
    [bgView addSubview:lb1];

    pickMinuView1 = [[UIPickerView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pickHourView1.frame), maxY, CGRectGetWidth(pickHourView1.frame), 120)];
    pickMinuView1.delegate = self;
    pickMinuView1.dataSource = self;
    pickMinuView1.tag = 2;
    [bgView addSubview:pickMinuView1];



    pickHourView2 = [[UIPickerView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pickMinuView1.frame)+30, maxY,  CGRectGetWidth(pickHourView1.frame), 120)];
    pickHourView2.delegate = self;
    pickHourView2.dataSource = self;
    pickHourView2.tag = 3;
    [bgView addSubview:pickHourView2];


    UILabel *lb2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pickHourView2.frame),  pickHourView1.center.y-15, 15, 30)];
    lb2.textColor = [UIColor blackColor];
    lb2.text = @":";
    [bgView addSubview:lb2];

    pickMinuView2 = [[UIPickerView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pickHourView2.frame), maxY,  CGRectGetWidth(pickHourView1.frame), 120)];
    pickMinuView2.delegate = self;
    pickMinuView2.dataSource = self;
    pickMinuView2.tag = 4;
    [bgView addSubview:pickMinuView2];


    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(pickMinuView2.frame)+5, self.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [bgView addSubview:line];


    countLB = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(pickMinuView2.frame)+6, self.frame.size.width, 30)];
    countLB.textAlignment = NSTextAlignmentCenter;
    countLB.textColor = [UIColor lightGrayColor];
    countLB.font = [UIFont systemFontOfSize:13];
    countLB.text = @"时间间隔：0分钟";
    [bgView addSubview:countLB];

    NSRange rang = NSMakeRange(5, countLB.text.length-7);

    NSMutableAttributedString *attstr = [[NSMutableAttributedString alloc] initWithString:countLB.text];

    // 添加文字颜色
    [attstr addAttribute:NSForegroundColorAttributeName
                   value:[UIColor blackColor]
                   range:rang];
    // 添加下划线
    [attstr addAttribute:NSFontAttributeName
                   value:[UIFont boldSystemFontOfSize:14]
                   range:rang];

    countLB.attributedText = attstr;
    

    UIView *bggView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(countLB.frame), self.frame.size.width, 40)];
    bggView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
    [bgView addSubview:bggView];

    UIButton *cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width/2.0, 40)];
    [cancleBtn setTitle:@"取消" forState:0];
    [cancleBtn setTitleColor:[UIColor darkGrayColor] forState:0];
    [cancleBtn addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    cancleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bggView addSubview:cancleBtn];

    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, 0, self.frame.size.width/2.0, 40)];
    [sureBtn setTitle:@"确定" forState:0];
      sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [sureBtn setTitleColor:SureButtonTitleColor forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [bggView addSubview:sureBtn];



    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, 10, 1, 20)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [bggView addSubview:line1];



}

- (void)cancle{
    if (_cancleSlect) {
        _cancleSlect();
    }
}

- (void)sure{
    if (_sureSlect) {
        self.sureSlect(time1,time2);
    }
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *tempArr = dataSource[pickerView.tag-1];
    return tempArr.count;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *tempArr = dataSource[pickerView.tag-1];
    return tempArr[row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

    UILabel* pickerLabel = (UILabel*)view;

    if (!pickerLabel){

        pickerLabel = [[UILabel alloc] init];

        pickerLabel.adjustsFontSizeToFitWidth = YES;

        [pickerLabel setTextAlignment:NSTextAlignmentCenter];

        [pickerLabel setBackgroundColor:[UIColor clearColor]];

        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];

    }

    // Fill the label text here

    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    
    return pickerLabel;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{


    if (pickerView.tag==1) {
        NSInteger otherRow=[pickHourView2 selectedRowInComponent:0];
        minIndex = row;
          minIndex = MIN(minIndex, [pickHourView2 numberOfRowsInComponent:0]-1);
        if (otherRow<minIndex) {
            [pickHourView2 selectRow:row inComponent:0 animated:YES];
        }
    }

    if (pickerView.tag==2) {
        NSInteger otherRow=[pickMinuView2 selectedRowInComponent:0];
        minIndex = row;
        minIndex = MIN(minIndex, [pickMinuView2 numberOfRowsInComponent:0]-1);
        if (otherRow<minIndex) {
            [pickMinuView2 selectRow:row inComponent:0 animated:YES];
        }
    }


//    if (pickerView.tag==1) {
//        NSInteger otherRow=[pickHourView2 selectedRowInComponent:0];
//        minIndex = row;
//
//        minIndex = MIN(minIndex, [pickHourView2 numberOfRowsInComponent:0]-1);
//        if (otherRow<minIndex) {
//            [pickHourView2 selectRow:minIndex inComponent:0 animated:YES];
//        }
//    }else{
//        if (row<=minIndex) {
//            [pickHourView2 selectRow:minIndex inComponent:0 animated:YES];
//        }
//    }
//    if (_getSelectTimeStr) {
//        NSInteger timeRow1=[pickHourView1 selectedRowInComponent:0];
//        NSInteger timeRow2=[pickHourView2 selectedRowInComponent:0];
//        _getSelectTimeStr(dataSource[0][timeRow1],dataSource[1][timeRow2]);
//    }

    [self cauclateTime];

}

- (void)cauclateTime{

    if (isShowTwo) {
        NSInteger timeHourRow1=[dataSource[0][[pickHourView1 selectedRowInComponent:0]] integerValue];
        NSInteger timeHourRow2=[dataSource[2][[pickHourView2 selectedRowInComponent:0]] integerValue];
        NSInteger hour = timeHourRow2-timeHourRow1;



        NSInteger timeMinuRow1=[dataSource[1][[pickMinuView1 selectedRowInComponent:0]] integerValue];
        NSInteger timeMinuRow2=[dataSource[3][[pickMinuView2 selectedRowInComponent:0]] integerValue];
        NSInteger minus = timeMinuRow2-timeMinuRow1;

        time1 = [NSString stringWithFormat:@"%02ld:%02ld",(long)timeHourRow1,(long)timeMinuRow1];
        time2 = [NSString stringWithFormat:@"%02ld:%02ld",(long)timeHourRow2,(long)timeMinuRow2];
        countLB.text =[NSString stringWithFormat: @"时间间隔：%ld分钟",(long)hour*60+minus];

        NSRange rang = NSMakeRange(5, countLB.text.length-7);

        NSMutableAttributedString *attstr = [[NSMutableAttributedString alloc] initWithString:countLB.text];

        // 添加文字颜色
        [attstr addAttribute:NSForegroundColorAttributeName
                       value:[UIColor blackColor]
                       range:rang];
        // 添加下划线
        [attstr addAttribute:NSFontAttributeName
                       value:[UIFont boldSystemFontOfSize:14]
                       range:rang];
        
        countLB.attributedText = attstr;
    }else{
        time1=dataSource[0][[pickHourView1 selectedRowInComponent:0]] ;

        time2=dataSource[1][[pickMinuView1 selectedRowInComponent:0]] ;


    }









}



@end
