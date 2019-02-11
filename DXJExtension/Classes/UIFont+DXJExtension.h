//
//  UIFont+DXJExtension.h
//  CarShareDriver
//
//  Created by 董向军 on 17/6/7.
//  Copyright © 2017年 华网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (DXJExtension)

/* 自定义字体 */
+ (UIFont *)HYQiHeiWithFontSize:(CGFloat)size;

/**
 *  Heiti SC font.黑体
 *
 *  @param size Font's size.
 *
 *  @return Font.
 */
+ (UIFont *)HeitiSCWithFontSize:(CGFloat)size;

/**
 *  GillSans font.数字字体
 *
 *  @param size Font's size.
 *
 *  @return Font.
 */
+ (UIFont *)GillSansWithFontSize:(CGFloat)size;

/**
 *  ArialRoundedMTBold font.VS.字体
 *
 *  @param size Font's size.
 *
 *  @return Font.
 */

+ (UIFont *)MTBoldWithFontSize:(CGFloat)size;

/**
 *  AppleSDGothicNeo-Thin font.
 *
 *  @param size Font's size.
 *
 *  @return Font.
 */
+ (UIFont *)AppleSDGothicNeoThinWithFontSize:(CGFloat)size;

/**
 *  Avenir font.
 *
 *  @param size Font's size.
 *
 *  @return Font.
 */
+ (UIFont *)AvenirWithFontSize:(CGFloat)size;

/**
 *  Avenir-Light font.
 *
 *  @param size Font's size.
 *
 *  @return Font.
 */
+ (UIFont *)AvenirLightWithFontSize:(CGFloat)size;

/**
 *  HelveticaNeue font.
 *
 *  @param size Font's size.
 *
 *  @return Font.
 */
+ (UIFont *)HelveticaNeueFontSize:(CGFloat)size;

/**
 *  HelveticaNeue-Bold font.
 *
 *  @param size Font's size.
 *
 *  @return Font.
 */
+ (UIFont *)HelveticaNeueBoldFontSize:(CGFloat)size;

@end
