//
//  UIFont+DXJExtension.m
//  CarShareDriver
//
//  Created by 董向军 on 17/6/7.
//  Copyright © 2017年 华网. All rights reserved.
//

#import "UIFont+DXJExtension.h"

@implementation UIFont (DXJExtension)

#pragma mark - System font.

+ (UIFont *)HYQiHeiWithFontSize:(CGFloat)size{

    return [UIFont fontWithName:@"HYQiHei" size:size];
}

+ (UIFont *)HeitiSCWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"Heiti SC" size:size];
}

+ (UIFont *)GillSansWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"GillSans-Italic" size:size];
}

+ (UIFont *)MTBoldWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"ArialRoundedMTBold" size:size];
}

+ (UIFont *)AppleSDGothicNeoThinWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:size];
}

+ (UIFont *)AvenirWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"Avenir" size:size];
}

+ (UIFont *)AvenirLightWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"Avenir-Light" size:size];
}

+ (UIFont *)HelveticaNeueFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+ (UIFont *)HelveticaNeueBoldFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}

@end
