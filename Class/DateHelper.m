//
//  DataConvertTool.m
//  UnixTime
//
//  Created by songxiaobo on 15/1/31.
//  Copyright (c) 2015年 zhayong. All rights reserved.
//

#import "DateHelper.h"

@interface DateHelper()

{
    NSDateFormatter *formatter;
}

@end

@implementation DateHelper

- (void)initialize
  {
    // 设置时间显示格式
    formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"]; // HH:24小时制 hh:12小时制
     NSTimeZone *zone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:zone];
   
  }

- (NSString *)draftTime
{
    [self initialize];
    NSDate *date = [NSDate date];
    NSString *timeString = [formatter stringFromDate:date];
    return timeString;
}

- (NSString *)draftDate
{
    [self initialize];
    NSDate *date = [NSDate date];
    [formatter setDateFormat:@"YYYY/MM/dd"];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

- (NSString *)calculateCostTimeWith:(NSString *)startTime andModifyTime:(NSString *)modifyTime
{
    NSDate *startDate = [formatter dateFromString:startTime];
    NSDate *modifyDate = [formatter dateFromString:modifyTime];
    
    NSTimeInterval timeInterval = [modifyDate timeIntervalSinceDate:startDate];
    
    int hour = (int)(timeInterval/3600);
    int minute = (int)(timeInterval - hour*3600)/60;
    int second = timeInterval - hour*3600 - minute*60;
    NSString *costTime = [NSString stringWithFormat:@"%d:%d:%d", hour, minute,second];
    return costTime;
}
@end
