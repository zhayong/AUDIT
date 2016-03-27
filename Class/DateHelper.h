//
//  DataConvertTool.h
//  UnixTime
//
//  Created by songxiaobo on 15/1/31.
//  Copyright (c) 2015年 zhayong. All rights reserved.
//  时间转换工具

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject

// 1.返回草稿开始时间 YYYY/MM/dd HH:mm:ss
- (NSString *)draftTime;

// 2.返回开始年月日
- (NSString *)draftDate;

// 3.计算花费时间
- (NSString *)calculateCostTimeWith:(NSString *)startTime andModifyTime:(NSString *)modifyTime;


@end
