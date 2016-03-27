//
//  ZYTabBarController.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "ZYTabBarController.h"
#import "ZYNavigationController.h"

#import "ZYTabBar.h"
#import "ZYTabBarButton.h"

#import "HomepageViewController.h"
#import "HistoryViewController.h"
#import "SettingsViewController.h"

@interface ZYTabBarController ()<ZYTabBarDelegate>

@property (nonatomic,weak) ZYTabBar *customTabBar;

@end

@implementation ZYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 自定义tabbar
    [self setupTabBar];
    
    // 初始化所有控制器
    [self setupAllChildVc];

    // Do any additional setup after loading the view.
}

/**
 *  删除系统自带的tabbarbutton
 *
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for(UIView *child in self.tabBar.subviews)
    {
        
        if([child isKindOfClass:[UIControl class]])
        {
            [child removeFromSuperview];
        }
    }
}

/**
 *  自定义tabbar
 */
- (void)setupTabBar
{
    ZYTabBar *customTabBar = [[ZYTabBar alloc]init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.frame = CGRectMake(self.tabBar.width / 4 , self.view.y, self.tabBar.width / 2, self.tabBar.height);
    customTabBar.ZYdelegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(ZYTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

/**
 *  初始化所有控制器
 */
- (void)setupAllChildVc
{
    // 主页
    HomepageViewController *homePageVc = [UIStoryboard instantiateViewControllerWithIdentifier:@"homePageVc" inStoryboardWithName:@"Main" bundle:nil];
    [self setupChildViewController:homePageVc title:@"主页" imageName:@"home_normal" selectedImageName:@"home_selected"];
   
    // 历史记录
    HistoryViewController *historyVc = [UIStoryboard instantiateViewControllerWithIdentifier:@"historyVc" inStoryboardWithName:@"Main" bundle:nil];
    [self setupChildViewController:historyVc title:@"历史" imageName:@"history_normal" selectedImageName:@"history_selected"];
    
    // 设置
    SettingsViewController *settingsVc = [UIStoryboard instantiateViewControllerWithIdentifier:@"settingsVc" inStoryboardWithName:@"Main" bundle:nil];
    [self setupChildViewController:settingsVc title:@"设置" imageName:@"settings_normal" selectedImageName:@"settings_selected"];
}
/**
 * 初始化一个控制器
 *
 *  @param childVc           需要初始化的控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中时候的图标
 */

- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置标题
    childVc.title = title;
    
    // 2.设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 3.设置选中图标
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 4.设置导航栏左边菜单按钮/右边扫描按钮
    UIButton *menuButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,44, 44)];

    [menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(menuButton_clicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:menuButton];
    childVc.navigationItem.leftBarButtonItem = menuItem;
    
    // 5.包装成导航控制器
    ZYNavigationController *nav = [[ZYNavigationController alloc]initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
    
    // 5.添加到tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
    
}
- (void)menuButton_clicked:(UIButton *)sender
{
   if([self.mydelegate respondsToSelector:@selector(menuClicked:)])
   {
       // 通知代理
       [self.mydelegate menuClicked:self];
   
   }

}

@end
