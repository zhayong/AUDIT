//
//  UIImage+BT.m
//  博物馆助手
//
//  Created by songxiaobo on 14/12/4.
//  Copyright (c) 2014年 zhayong. All rights reserved.
//

#import "UIImage+BT.h"

@implementation UIImage (BT)

+ (UIImage *)imageWithName:(NSString *)name
{
    if(SYSTEM_VERSION > 7.0){  // iOS7
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if(image == nil)
        {
            
            image = [UIImage imageNamed:name];
        
        }
    
        return image;
    }
    // 非iOS7
    return [UIImage imageNamed:name];
    
}

// 返回一张自由拉伸的图片
+ (UIImage *)resizedImageWithName:(NSString *)name
{

    UIImage *image = [self imageWithName:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
