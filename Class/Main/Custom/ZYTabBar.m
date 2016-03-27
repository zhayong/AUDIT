//
//  ZYTabBar.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "ZYTabBar.h"
#import "ZYTabBarButton.h"
#import "UIImage+BT.h"

@interface ZYTabBar()

@property (nonatomic,strong) NSMutableArray *tabBarButtonArray;
@property (nonatomic, weak) ZYTabBarButton *selectedButton;

@end

@implementation ZYTabBar

- (NSMutableArray *)tabBarButtonArray
{
    if(_tabBarButtonArray == nil)
    {
        _tabBarButtonArray = [NSMutableArray array];
    }
    return _tabBarButtonArray;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tab_background"]];
    }
    return self;
    
    
}
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 1. 创建一个按钮
    ZYTabBarButton *tabBtn = [[ZYTabBarButton alloc]init];
    [self addSubview:tabBtn];
    //2.添加到按钮数组中
    [self.tabBarButtonArray addObject:tabBtn];
    // 3.设置按钮
    tabBtn.item = item;
    // 4.监听按钮点击
    [tabBtn addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchDown];
    
    // 5.设置默认选中按钮
    if(self.tabBarButtonArray.count == 1)
        [self tabBarClick:tabBtn];
}

/**
 *  监听按钮点击
 */

- (void)tabBarClick:(ZYTabBarButton *)button
{
    
    // 1.通知代理
    if ([self.ZYdelegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.ZYdelegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 按钮的frame
    CGFloat buttonH = self.frame.size.height;
    ZYLog(@"%lu",(unsigned long)self.subviews.count);
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonY = 0;
    for (int index = 0; index < self.tabBarButtonArray.count; index ++) {
        // 1.取出按钮
        ZYTabBarButton *button = self.tabBarButtonArray[index];
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
    }
    
}



@end
