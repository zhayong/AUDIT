//
//  UIImage+BT.h
//  博物馆助手
//
//  Created by songxiaobo on 14/12/4.
//  Copyright (c) 2014年 zhayong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BT)
/**
 *  加载图片
 *
 *  @param name 图片名
 *
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
@end
