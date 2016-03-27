//
//  ZYTabBar.h
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYTabBar;
@protocol ZYTabBarDelegate <NSObject>

@optional

- (void)tabBar:(ZYTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface ZYTabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<ZYTabBarDelegate> ZYdelegate;

@end
