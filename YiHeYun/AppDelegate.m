//
//  AppDelegate.m
//  YiHeYun
//
//  Created by zyl on 17/2/26.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "AppDelegate.h"
#import "NetworkUtil.h"
#import <IQKeyboardManager.h>
#import "BaseNC.h"
#import "HomeVC.h"
#import "FindVC.h"
#import "SettingVC.h"
#import "MineVC.h"

@interface AppDelegate ()
{
    UITabBarController *myTabBarController;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //键盘事件处理
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = PageColor;
    
    //[[UserInfo share] getUserInfo];
    //[AEFilePath createDirPath];
    [[NetworkUtil sharedInstance] listening]; //监测网络

    self.window.rootViewController = [self setTabBarController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UITabBarController *)setTabBarController {
    
    //步骤1：初始化视图控制器
    HomeVC *homeVC = [[HomeVC alloc] init]; //首页
    FindVC *findVC = [[FindVC alloc] init]; //发现
    SettingVC *settingVC = [[SettingVC alloc] init]; //设定
    MineVC *mineVC = [[MineVC alloc] init]; //我
    
    //步骤2：将视图控制器绑定到导航控制器上
    BaseNC *nav1C = [[BaseNC alloc] initWithRootViewController:homeVC];
    BaseNC *nav2C = [[BaseNC alloc] initWithRootViewController:findVC];
    BaseNC *nav3C = [[BaseNC alloc] initWithRootViewController:settingVC];
    BaseNC *nav4C = [[BaseNC alloc] initWithRootViewController:mineVC];
    
    //步骤3：将导航控制器绑定到TabBar控制器上
    myTabBarController = [[UITabBarController alloc] init];
    myTabBarController.delegate = self;
    
    //改变tabBar的背景颜色
    UIView *barBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 49)];
    barBgView.backgroundColor = [UIColor whiteColor]; 
    [myTabBarController.tabBar insertSubview:barBgView atIndex:0];
    myTabBarController.tabBar.opaque = YES;
    
    myTabBarController.viewControllers = @[nav1C,nav2C,nav3C,nav4C]; //需要先绑定viewControllers数据源
    myTabBarController.selectedIndex = 0; //默认选中第几个图标（此步操作在绑定viewControllers数据源之后）
    
    //初始化TabBar数据源
    NSArray *titles = @[@"首页",@"发现",@"设定",@"我"];
    NSArray *images = @[@"UnTabbarHome",@"UnTabbarFind",@"UnTabbarSetting",@"UnTabbarMine"];
    NSArray *selectedImages = @[@"TabbarHome",@"TabbarFind",@"TabbarSetting",@"TabbarMine"];
    
    //绑定TabBar数据源
    for (int i = 0; i<myTabBarController.tabBar.items.count; i++) {
        UITabBarItem *item = (UITabBarItem *)myTabBarController.tabBar.items[i];
        item.title = titles[i];
        item.image = [[UIImage imageNamed:[images objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:[selectedImages objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
        [item setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    }
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:AppThemeColor,NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:LightBlackColor,NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateNormal];
    
    return myTabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
