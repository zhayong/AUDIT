//
//  ZYNavigationController.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "ZYNavigationController.h"

@interface ZYNavigationController ()<UINavigationControllerDelegate,UINavigationBarDelegate>

@end

@implementation ZYNavigationController

// 第一次使用只会调用一次
+ (void)initialize
{
    // 1. 设置导航条属性
    [self setupNavTitle];
    
    // 2. 设置导航条按钮属性
    [self setupNavButton];
}
/**
 *  设置导航条按钮属性
 */
+ (void)setupNavButton
{
    
    // 1.取出BarButtonItem
    UIBarButtonItem *item = [UIBarButtonItem appearance];

    // 2.设置背景
    
    // 3. 设置按钮文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] =  [UIColor blueColor];
    
    //textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];

}

/**
 *  设置导航条属性
 */
+ (void)setupNavTitle
{
    // 1.取出NavigationBar
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 2.设置背景
//    [navBar setBackgroundImage:[UIImage imageNamed:@"bar_background"] forBarMetrics:UIBarMetricsDefault];
    
    // 3. 设置标题属性
    NSMutableDictionary *titleAttrs = [NSMutableDictionary dictionary];
//    titleAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    // titleAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    titleAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:19];
    
    [navBar setTitleTextAttributes:titleAttrs];
}

/**
 *  跳转页面隐藏导航栏
 *
 */
- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0)
    {
        // 下一页隐藏标签栏
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:YES];
    
}


@end
