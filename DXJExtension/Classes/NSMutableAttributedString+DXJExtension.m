//
//  NSMutableAttributedString+DXJExtension.m
//  sxy618-iOS
//
//  Created by 董向军 on 2018/8/2.
//  Copyright © 2018年 董向军. All rights reserved.
//

#import "NSMutableAttributedString+DXJExtension.h"

@implementation NSMutableAttributedString (DXJExtension)

+ (NSMutableAttributedString *)getSuperAttribute:(NSString *)str WithBoldFont:(NSInteger)font AndColor:(UIColor *)color {
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:str];
    one.font = [UIFont boldSystemFontOfSize:font];
    one.color = color;
    return one;
}
+ (NSMutableAttributedString *)getSuperAttribute:(NSString *)str WithFont:(NSInteger)font AndColor:(UIColor *)color {
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:str];
    one.font = [UIFont systemFontOfSize:font];
    one.color = color;
    return one;
}

@end
