//
//  ZSPickView.m
//  ZSPickView
//
//  Created by zyl on 16/8/19.
//  Copyright © 2016年 zrgg. All rights reserved.
//
//

#import "ZSPickView.h"


#define ColorRGB(a, b, c)   [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1]

@interface ZSPickView()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UILabel *titleLB;
}
@property(nonatomic,strong)UIPickerView *pickview;
@property(nonatomic,strong)NSArray *oneArr;
@property(nonatomic,strong)NSArray *twoArr;
@property(nonatomic,strong)NSArray *threeArr;
@property(nonatomic,assign)NSInteger isNum;
@property(nonatomic,strong)UIBarButtonItem *cancelBtn;
@property(nonatomic,strong)UIBarButtonItem *sureBtn;
@property(nonatomic,strong)NSArray *sureArr;
@property(nonatomic,strong)NSString *oneStr;
@property(nonatomic,strong)NSString *twoStr;
@property(nonatomic,strong)NSString *threeStr;
@property(nonatomic,assign)BOOL isrelation;
@property(nonatomic,strong)NSArray *relationComponentArr;
@property(nonatomic,strong)NSString *rightIndefile;
@property(nonatomic,strong)NSString *leftIndefile;
@property (nonatomic , assign)NSInteger currentIndex;


@end
@implementation ZSPickView
#define screenH [UIScreen mainScreen].bounds.size.height
#define screenW [UIScreen mainScreen].bounds.size.width
- (void)setTitle:(NSString *)title{
titleLB.text = title;
}

-(instancetype)initWithComponentArr:(NSArray *)Arr{
    self = [super init];
    if (self) {
        self.componentArr = Arr;
        [self setupUI];
    }
    return self;
}

-(instancetype)initWithRelationComponentArr:(NSArray *)Arr withRight:(NSString *)rightStr withLeft:(NSString *)leftStr{
    self = [super init];
    if (self) {
        self.rightIndefile = rightStr;
        self.leftIndefile = leftStr;
        self.relationComponentArr = Arr;
        [self setupUI];
    }
    return self;
}


-(UIPickerView *)pickview{
    if (_pickview == nil) {
        _pickview = [[UIPickerView alloc]init];
        _pickview.delegate = self;
        _pickview.dataSource = self;
        _pickview.frame = CGRectMake(0, 50, screenW, 200);
        _pickview.backgroundColor = [UIColor groupTableViewBackgroundColor];
//        _pickview.backgroundColor = [UIColor whiteColor];
    }
    return _pickview;
}

-(void)setComponentArr:(NSArray *)componentArr{
    _componentArr = componentArr;
    [_pickview selectRow:0 inComponent:0 animated:NO];
    
//    for (int i=0; i<componentArr.count; i++) {
//        id sub = componentArr[i];
//        if ([sub isKindOfClass:[NSArray class]]) {
//            self.isNum = componentArr.count;
//            if (i == 0) {
//                self.oneArr = sub;
//            }
//            if (i == 1) {
//                self.twoArr = sub;
//            }
//            if (i == 2) {
//                self.threeArr = sub;
//            }
//        }else{
            self.oneArr = componentArr;
//        }
//    }
    
    [self.pickview reloadAllComponents];
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
//    if (self.isNum) {
//        return self.isNum;
//    }else{
//        return 1;
//    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
//    if (self.isNum) {
//        if (component == 0) {
//            return self.oneArr.count;
//        }
//        if (component == 1) {
//            return self.twoArr.count;
//        }
//        if (component == 2) {
//            return self.threeArr.count;
//        }
//    }else{
    
        return self.oneArr.count;
//    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
      
   
//    if (self.isNum) {
//        if (component == 0) {
//            if (self.isrelation) {
//                return [NSString stringWithFormat:@"%@",self.oneArr[row][self.leftIndefile]];
//            }else{
//                return [NSString stringWithFormat:@"%@",self.oneArr[row]];
//             }
//        }
//        if (component == 1) {
//            return [NSString stringWithFormat:@"%@",self.twoArr[row]];
//        }
//        if (component == 2) {
//            return [NSString stringWithFormat:@"%@",self.threeArr[row]];
//        }
//    }else{
        return [NSString stringWithFormat:@"%@",self.oneArr[row]];
//    }
    return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{


   _currentIndex = row;

//    if (self.isNum) {
//        if (component == 0) {
//            if (self.isrelation) {
//                self.twoArr = self.oneArr[row][self.rightIndefile];
//                [self.pickview reloadComponent:1];
//                self.oneStr = self.oneArr[row][self.leftIndefile];
//            }else{
//              self.oneStr = self.oneArr[row];  
//            }
//        }
//        if (component == 1) {
//            self.twoStr = self.twoArr[row];
//        }
//        if (component == 2) {
//            self.threeStr = self.threeArr[row];
//        }
//    }else{
//
//
//        self.oneStr = self.oneArr[row];
//    }
}

-(void)setupUI{
    self.frame = CGRectMake(0, screenH-250, screenW, 250);

    [self addSubview:self.pickview];


    titleLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.font = [UIFont systemFontOfSize:14];
    titleLB.textColor = [UIColor darkGrayColor];


    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [cancleBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
//    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancleBtn.frame = CGRectMake(0, 0, WIDTH/2.0, 50);
    [cancleBtn setTitleColor:ColorRGB(19, 132, 255) forState:UIControlStateNormal];
    cancleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    cancleBtn.backgroundColor = [UIColor whiteColor];
    cancleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:cancleBtn];


    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    [sureBtn setTitle:@"完成" forState:UIControlStateNormal];
    sureBtn.backgroundColor = [UIColor whiteColor];
    sureBtn.frame = CGRectMake(WIDTH/2.0, 0, WIDTH/2.0, 50);
//     [sureBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [sureBtn setTitleColor:SureButtonTitleColor forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    sureBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15);
    sureBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self addSubview:sureBtn];

   [self addSubview:titleLB];

}

-(void)cancelClick{
    if (_cancleBlock) {
        self.cancleBlock();
    }
//    [self removeFromSuperview];
}
-(void)sureClick{
    if (self.sureBlock) {
        self.sureBlock(self.sureArr.copy);
    }
    if (self.getCurrentIndex) {
        self.getCurrentIndex(_currentIndex);
    }
//    [self removeFromSuperview];
}





















@end
