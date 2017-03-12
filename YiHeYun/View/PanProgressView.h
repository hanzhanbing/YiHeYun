//
//  PanProgressView.h
//  selectTime
//
//  Created by mac on 2017/3/10.
//  Copyright © 2017年 zrgg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanProgressView : UIView
- (id)initWithFrame:(CGRect)frame andUnit:(NSString *)unit;
@property (nonatomic , copy)NSString *title;
@property (nonatomic , copy)void (^cancleSlect)();
@property (nonatomic , copy)void (^sureSlect)(NSString *,NSString *);



@end
