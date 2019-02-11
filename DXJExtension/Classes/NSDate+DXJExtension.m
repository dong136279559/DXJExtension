//
//  NSDate+DXJExtension.m
//  sxy618-iOS
//
//  Created by 董向军 on 2018/7/3.
//  Copyright © 2018年 董向军. All rights reserved.
//

#import "NSDate+DXJExtension.h"

@implementation NSDate (DXJExtension)

+ (NSString *)nowFromDateExchange:(long)oldTime {//oldTime 为服务器返回的发布消息时间距离1970年多少毫秒
    
    // 同java的System.currentTimeMillis();
    // NSTimeInterval nowtime = [[NSDate date] timeIntervalSince1970]*1000;
    

    
    //    计算现在距1970年多少秒
    NSDate *date = [NSDate date];
    NSTimeInterval currentTime= [date timeIntervalSince1970];
    
    //    计算现在的时间和发布消息的时间时间差
    double timeDiffence = currentTime - oldTime * 0.001;
    
    //    根据秒数的时间差的不同，返回不同的日期格式
    if (timeDiffence <= 60) {
        return [NSString stringWithFormat:@"%.0f 秒前",timeDiffence];
    }else if (timeDiffence <= 60 * 60){
        return [NSString stringWithFormat:@"%.0f 分钟前",timeDiffence / 60];
    }else if (timeDiffence <= 60 * 60 * 24){
        return [NSString stringWithFormat:@"%.0f 小时前",timeDiffence / 3600];
    }else if (timeDiffence <= 60 * 60 * 24 * 7){// 7天前的显示
        return [NSString stringWithFormat:@"%.0f 天前",timeDiffence / 3600 /24];
    }else{
        //    返回具体日期
        NSDate *oldTimeDate = [NSDate dateWithTimeIntervalSince1970:oldTime * 0.001];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        if (oldTimeDate.yearsAgo) { // 判断是否是前年
            [formatter setDateFormat:@"yyyy月MM日dd"];
        }else{
            [formatter setDateFormat:@"MM日dd"];
        }
        return [formatter stringFromDate:oldTimeDate];
    }
}
/**
 *  将日期转换为当前时区的日期
 *
 *  @param forDate 要转换的日期
 *
 *  @return 转换过的日期
 */
+ (NSDate *)convertDateToLocalTime: (NSDate *)forDate {
    
    NSTimeZone *nowTimeZone = [NSTimeZone localTimeZone];
    NSInteger timeOffset = [nowTimeZone secondsFromGMTForDate:forDate];
    NSDate *newDate = [forDate dateByAddingTimeInterval:timeOffset];
    return newDate;
}

@end
