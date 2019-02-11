//
//  NSString+DXJExtension.h
//  sxy618-iOS
//
//  Created by 董向军 on 2018/6/6.
//  Copyright © 2018年 董向军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DXJExtension)

/**  检测是否全为数字  */
- (BOOL)charsAllNumber ;
/**  检测是否是手机号  */
- (BOOL)isValiMobile ;
/**  json 转 数组  */
- (NSArray *)stringToArray;
/**  判断是否含有非法字符  */
- (BOOL)judgeTheillegalCharacter ;
/**  登录验证  */
- (BOOL)loginRegExVerify ;
@end
