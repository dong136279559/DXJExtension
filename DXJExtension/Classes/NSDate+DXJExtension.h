//
//  NSDate+DXJExtension.h
//  sxy618-iOS
//
//  Created by 董向军 on 2018/7/3.
//  Copyright © 2018年 董向军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DXJExtension)

+ (NSString *)nowFromDateExchange:(long)oldTime ;

+ (NSDate *)convertDateToLocalTime: (NSDate *)forDate;

@end
