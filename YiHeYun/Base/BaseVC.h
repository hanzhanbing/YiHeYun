//
//  BaseVC.h
//  ArtEast
//
//  Created by yibao on 16/9/21.
//  Copyright © 2016年 北京艺宝网络文化有限公司. All rights reserved.
//

/**
 *  VC基类
 *
 */

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController<UITextFieldDelegate,UITextViewDelegate,UITabBarDelegate>

//self.navBar.hidden = YES; //隐藏导航条,在子类viewWillAppear里面调用
@property (nonatomic,retain) UINavigationBar *navBar;
@property (nonatomic,retain) UINavigationItem *navItem;

//self.isPanForbid = YES; //禁用iOS自带侧滑返回手势(1、手势冲突，比如地图；2、不是继承基类的VC，比如继承UIViewController/UITableViewController/UISearchController),在子类viewDidLoad方法里面调用
@property (nonatomic,assign) BOOL isPanForbid;

@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,assign) CGRect tableFrame;
@property (nonatomic,assign) CGRect tempFrame;

/*!
 *  @brief 无网络
 */
- (void)netWorkDisappear;

/*!
 *  @brief 有网络
 */
- (void)netWorkAppear;

/*!
 *  @brief 获取数据
 */
- (void)getData;

/*!
 *  @brief 返回
 */
- (void)backAction;

/*!
 *  @brief 下拉刷新
 */
- (void)tableViewGifHeaderWithRefreshingBlock:(void(^)()) block;

/*!
 *  @brief 上拉加载
 */
- (void)tableViewGifFooterWithRefreshingBlock:(void(^)()) block;

/**
 *  短信验证码按钮封装
 */
- (void)startTimeCount:(UIButton *)l_timeButton;

@end
