//
//  NSDictionary+DXJExtension.m
//  CarShareDriver
//
//  Created by 董向军 on 17/6/26.
//  Copyright © 2017年 华网. All rights reserved.
//

#import "NSDictionary+DXJExtension.h"

@implementation NSDictionary (DXJExtension)


/********返回值做循环判断是否返回为null，改为空字符串*********/
- (NSDictionary *)deleteAllNullValue
{
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyStr in self.allKeys) {
        if ([[self objectForKey:keyStr] isEqual:[NSNull null]]) {
            [mutableDic setObject:@"" forKey:keyStr];
        }
        else{
            [mutableDic setObject:[self objectForKey:keyStr] forKey:keyStr];
        }
    }
    
    return mutableDic;
}

/**  获取网络请求错误信息  */
- (NSString *)getWrongMessage {
    NSString *str = [self objectForKey:@"msg"];
    if (kStringIsEmpty(str)) {
        str = @"";
    }
    return  str;
}
/**  判断请求是否正确  */
- (BOOL)judgeResponseIsRight {
    return [[self objectForKey:@"code"] integerValue] == SXY_InterfaceSuccess;
}
/**  返回code错误请求码  */
- (NSInteger)getNetworkActionCode {
    return [[self objectForKey:@"code"] integerValue];
}
/**  获取请求内容  */
- (id)getContentData {
    return [self objectForKey:@"data"];
}
/**  获取返回列表个数  */
- (NSInteger)getTotalCount {
    return  [[self objectForKey:@"totalCount"] integerValue];
}
@end
