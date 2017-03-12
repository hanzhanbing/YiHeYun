//
//  SelectTimeView.h
//  selectTime
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 zrgg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTimeView : UIView

- (id)initWithFrame:(CGRect)frame WithSingSlect:(BOOL)showSingle;

@property (nonatomic , copy)void (^getSelectTimeStr)(NSString *,NSString *);

@property (nonatomic , copy)NSString *title;
@property (nonatomic , copy)void (^cancleSlect)();
@property (nonatomic , copy)void (^sureSlect)(NSString *,NSString *);



@end
