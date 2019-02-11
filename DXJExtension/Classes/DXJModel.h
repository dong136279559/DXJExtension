//
//  DXJModel.h
//  YichuxingPassenger
//
//  Created by 董向军 on 17/5/2.
//  Copyright © 2017年 董向军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DXJModel : NSObject

/**
 *  随机返回某个区间范围内的值 .2f
 */
+ (CGFloat) randomBetween:(CGFloat)smallerNumber And:(CGFloat)largerNumber;
/**
 *  获取文件大小(G)
 */
+ (NSString *)getTotalSize:(int64_t)totleSize;



/**
 打印属性字段

 @param class 类名
 */
+ (void)getFiledWithClass:(Class)className ;
+ (void)getMethodWithClass:(Class)className ;
/**
 *  默认搜索
 *
 *  @param fieldArray  搜索字段数组
 *  @param inputString 输入文字
 *  @param array       搜索数据源
 *
 *  @return 搜索结果
 */
+ (NSArray *)searchWithFieldArray:(NSArray *)fieldArray
                      inputString:(NSString *)inputString
                          inArray:(NSArray *)array;

/**
 *  分组搜索
 *
 *  @param allFieldArray  字段数组集合 @[@[@"name",@"cSpell"],@[@"name",@"cSpell"]]
 *  @param inputString 输入文字
 *  @param allArray  搜索数组集合
 *
 *  @return 搜索结果
 */
+ (NSArray *)searchWithAllFieldArray:(NSArray *)allFieldArray
                         inputString:(NSString *)inputString
                          inAllArray:(NSArray *)allArray;


/**
 获取汉字转成拼音字符串 通讯录模糊搜索 支持拼音检索 首字母 全拼 汉字 搜索

 @param aString
 @return 
 */
+ (NSString *)transformToPinyin:(NSString *)aString ;



/**
 获取时长的正确显示格式

 @param totalTime 总时间
 @return 正确的显示样式
 */
+ (NSString *)getRightTimeFormatWithTotalTime:(CGFloat)totalTime ;
+ (NSString *)getRightTime2FormatWithTotalTime:(CGFloat)totalTime ;


/**
 获取数量的正确显示格式
 
 @param totalNum 总数量
 @return 正确的人数显示
 */
+ (NSString *)getRightNumFormatWithTotalNum:(int)totalNum;


/**
 获取当前路径下所有文件

 @param path 当前路径
 @return 所有文件
 */
+ (NSArray *)getAllFilesFromPath:(NSString *)path;



@end
