//
//  NSMutableAttributedString+DXJExtension.h
//  sxy618-iOS
//
//  Created by 董向军 on 2018/8/2.
//  Copyright © 2018年 董向军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (DXJExtension)

/**
 *   富文本操作
 */
+ (NSMutableAttributedString *)getSuperAttribute:(NSString *)str WithBoldFont:(NSInteger)font AndColor:(UIColor *)color ;
+ (NSMutableAttributedString *)getSuperAttribute:(NSString *)str WithFont:(NSInteger)font AndColor:(UIColor *)color ;
@end
