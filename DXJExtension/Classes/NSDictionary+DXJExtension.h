//
//  NSDictionary+DXJExtension.h
//  CarShareDriver
//
//  Created by 董向军 on 17/6/26.
//  Copyright © 2017年 华网. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DXJExtension)

- (NSDictionary *)deleteAllNullValue;
/**  获取网络请求错误信息  */
- (NSString *)getWrongMessage ;
/**  判断请求是否正确  */
- (BOOL)judgeResponseIsRight ;
/**  获取请求内容 -> 可能是任意类型  */
- (id)getContentData ;
/**  获取返回列表个数  */
- (NSInteger)getTotalCount ;
/**  返回code错误请求码  */
- (NSInteger)getNetworkActionCode ;
@end
