//
//  NSDecimalNumber+Addtion.h
//  有应用应用
//
//  Created by xuliying on 15/10/15.
//  Copyright (c) 2015年 xly. All rights reserved.
//


//四舍五入 保留两位小数
//NSLog(@"%@",handlerDecimalNumber(str1, NSRoundPlain, 2));//12345.68
//向上入 保留两位小数
//NSLog(@"%@",handlerDecimalNumber(str1, NSRoundUp, 2));//12345.68
//向下舍 保留两位小数
//NSLog(@"%@",handlerDecimalNumber(str1, NSRoundDown, 2));//12345.67
//Bankers
//NSLog(@"%@",handlerDecimalNumber(str1, NSRoundBankers, 2));//12345.68


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, calculationType) {
    Add,
    Subtract,
    Multiply,
    Divide
};
@interface NSDecimalNumber (Addtion)
+(NSDecimalNumber *)aDecimalNumberWithStringOrNumberOrDecimalNumber:(id)stringOrNumber1 type:(calculationType)type anotherDecimalNumberWithStringOrNumberOrDecimalNumber:(id)stringOrNumber2 andDecimalNumberHandler:(NSDecimalNumberHandler *)handler;

+(NSComparisonResult)aDecimalNumberWithStringOrNumberOrDecimalNumber:(id)stringOrNumber1 compareAnotherDecimalNumberWithStringOrNumberOrDecimalNumber:(id)stringOrNumber2;
+(NSString *)stringWithDecimalNumber:(NSDecimalNumber *)str1 scale:(NSInteger)scale;

extern NSComparisonResult StrNumCompare(id str1,id str2);

extern NSDecimalNumber *handlerDecimalNumber(id strOrNum,NSRoundingMode mode,int scale);


extern NSComparisonResult SNCompare(id strOrNum1,id strOrNum2);//比较大小


extern NSDecimalNumber *SNAdd(id strOrNum1,id strOrNum2);// 加
extern NSDecimalNumber *SNSub(id strOrNum1,id strOrNum2);// 减
extern NSDecimalNumber *SNMul(id strOrNum1,id strOrNum2);// 乘
extern NSDecimalNumber *SNDiv(id strOrNum1,id strOrNum2);// 除


extern NSDecimalNumber *SNMin(id strOrNum1,id strOrNum2);//取小
extern NSDecimalNumber *SNMax(id strOrNum1,id strOrNum2);//取大


extern NSDecimalNumber *SNAdd_handler(id strOrNum1,id strOrNum2,NSRoundingMode mode,int scale);
extern NSDecimalNumber *SNSub_handler(id strOrNum1,id strOrNum2,NSRoundingMode mode,int scale);
extern NSDecimalNumber *SNMul_handler(id strOrNum1,id strOrNum2,NSRoundingMode mode,int scale);
extern NSDecimalNumber *SNDiv_handler(id strOrNum1,id strOrNum2,NSRoundingMode mode,int scale);


extern NSDecimalNumber *SNMin_handler(id strOrNum1,id strOrNum2,NSRoundingMode mode,int scale);
extern NSDecimalNumber *SNMax_handler(id strOrNum1,id strOrNum2,NSRoundingMode mode,int scale);


@end
