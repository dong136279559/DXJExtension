//
//  NSString+DXJExtension.m
//  sxy618-iOS
//
//  Created by 董向军 on 2018/6/6.
//  Copyright © 2018年 董向军. All rights reserved.
//

#import "NSString+DXJExtension.h"

@implementation NSString (DXJExtension)


#pragma mark  ————— 检测是否全为数字 —————
- (BOOL)charsAllNumber {
    if (self.length == 0) {
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}
#pragma mark  ————— 检测是否是手机号 —————
- (BOOL)isValiMobile {
    
    if (self.length != 11)
    {
        return NO;
    }
    NSString *MOBILE = @"^1([3-9])\\d{9}$";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:self]){
        return YES;
    }else{
        return NO;
    }
}

- (NSArray *)stringToArray {
        id tmp = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments | NSJSONReadingMutableLeaves | NSJSONReadingMutableContainers error:nil];
        if (tmp) {
            if ([tmp isKindOfClass:[NSArray class]]) {
                return tmp;
            } else if([tmp isKindOfClass:[NSString class]]
                      || [tmp isKindOfClass:[NSDictionary class]]) {
                return [NSArray arrayWithObject:tmp];
            } else {
                return nil;
            }
        } else {
            return nil;
        }
}
//判断是否含有非法字符 yes 有  no没有
- (BOOL)judgeTheillegalCharacter {
    //提示 标签不能输入特殊字符
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}
// 登录 正则验证
- (BOOL)loginRegExVerify {
    // 密码必须包含数字,字母,特殊字符中的两种 , 在8位到16位之间
    NSString *str =@"^(?!\\D+$)(?![^a-zA-Z]+$)\\S{8,16}$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if ([emailTest evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}
@end
