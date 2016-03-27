//
//  ZYTabBarController.h
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYTabBarController;

@protocol ZYTabBarControllerDelegate <NSObject>

@optional

- (void)menuClicked:(ZYTabBarController *)tabVc;
- (void)scanClicked:(ZYTabBarController *)tabVc;

@end

@interface ZYTabBarController : UITabBarController

@property (nonatomic,weak) id<ZYTabBarControllerDelegate> mydelegate;

@end
