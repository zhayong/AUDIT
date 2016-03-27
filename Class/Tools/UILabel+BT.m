//
//  UILabel+BT.m
//  BTMuseumPlatform
//
//  Created by songxiaobo on 15/4/7.
//  Copyright (c) 2015年 zhayong. All rights reserved.
//

#import "UILabel+BT.h"

@implementation UILabel (BT)

/**
 *  计算文本的高度
 *
 *  @param string  文本内容
 *  @param font    文本的字体
 *  @param maxSize 文本的指定范围
 *
 *  @return 文本宽高
 */
-(CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize
{
    // 如果将来计算的文本范围超出指定范围，返回的就是指定范围
    // 如果将来计算的文本范围小于指定范围，返回的就是真实的范围
    
    NSDictionary *attributes = @{NSFontAttributeName:font};
    
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    return size;
}

@end
