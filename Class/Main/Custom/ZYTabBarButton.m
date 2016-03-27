//
//  ZYTabBarButton.m
//  ZGMuseum
//
//  Created by 卓谨科技 on 15/5/18.
//  Copyright (c) 2015年 zhuojin. All rights reserved.
//

#import "ZYTabBarButton.h"

// 图标的比例
#define BTTabBarButtonImageRatio 0.6

// 按钮的默认文字颜色
#define  BTTabBarButtonTitleColor ZYColor(112, 172, 226)
// 按钮的选中文字颜色
#define  BTTabBarButtonTitleSelectedColor  ZYColor(112, 172, 226)

@implementation ZYTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 设置文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 设置文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        // 设置文字颜色
        [self setTitleColor:BTTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:BTTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
        //[self setBackgroundImage:[UIImage imageWithName:@"bar_selected"] forState:UIControlStateSelected];
        
    }
    if(SYSTEM_VERSION < 7.0){
        // 非iOS7按钮选中时的背景颜色
        
    }
    
    return self;
}

// 重写去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted {}

// button 内部的图片的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * BTTabBarButtonImageRatio;
    return  CGRectMake(0,0, imageW, imageH);
    
}
// button 内部文字的fram
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * BTTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
// 设置item
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // KVO 监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
//    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
//    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/**
 *  监听到某个对象的属性改变了,就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
}


@end
