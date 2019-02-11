//
//  UIColor+DXJExtension.h
//  YichuxingPassenger
//
//  Created by 董向军 on 17/5/2.
//  Copyright © 2017年 董向军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DXJExtension)

+ (UIColor *)colorWithHexString: (NSString *)color;

/* 背景颜色 */
+ (UIColor *)backgroundColor;

/* 线的颜色 */
+ (UIColor *)lineColor;

/* 随机色 */
+ (UIColor *)RandomColor ;

+ (UIColor *)customGrayColor;
+ (UIColor *)customRedColor;
+ (UIColor *)customYellowColor;
+ (UIColor *)customGreenColor;
+ (UIColor *)customBlueColor;

@end
