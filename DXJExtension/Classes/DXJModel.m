//
//  DXJModel.m
//  YichuxingPassenger
//
//  Created by 董向军 on 17/5/2.
//  Copyright © 2017年 董向军. All rights reserved.
//

#import "DXJModel.h"
#import <objc/runtime.h>

@implementation DXJModel

//随机返回某个区间范围内的值
+ (CGFloat) randomBetween:(CGFloat)smallerNumber And:(CGFloat)largerNumber
{
    //设置精确的位数
    int precision = 100;
    //先取得他们之间的差值
    float subtraction = largerNumber - smallerNumber;
    //取绝对值
    subtraction = ABS(subtraction);
    //乘以精度的位数
    subtraction *= precision;
    //在差值间随机
    float randomNumber = arc4random() % ((int)subtraction+1);
    //随机的结果除以精度的位数
    randomNumber /= precision;
    //将随机的值加到较小的值上
    float result = MIN(smallerNumber, largerNumber) + randomNumber;
    //返回结果
    return result;
}

#pragma mark - 获取文件大小
+ (NSString *)getTotalSize:(int64_t)totleSize{
    
    NSString *sizeText = nil;
    if (totleSize >= pow(10, 9)) { // size >= 1GB
        sizeText = [NSString stringWithFormat:@"%.2fGB", totleSize / pow(10, 9)];
    } else if (totleSize >= pow(10, 6)) { // 1GB > size >= 1MB
        sizeText = [NSString stringWithFormat:@"%.2fMB", totleSize / pow(10, 6)];
    } else if (totleSize >= pow(10, 3)) { // 1MB > size >= 1KB
        sizeText = [NSString stringWithFormat:@"%.2fKB", totleSize / pow(10, 3)];
    } else { // 1KB > size
        sizeText = [NSString stringWithFormat:@"%lldB", totleSize];
    }
    
    return sizeText;
    
}
#pragma mark  ————— 本地搜索🔍 —————
+ (NSArray *)searchWithFieldArray:(NSArray *)fieldArray
                      inputString:(NSString *)inputString
                          inArray:(NSArray *)array
{
    if (![array count] || ![fieldArray count]) {
        return nil;
    }
    
    // 谓语
    NSPredicate *scopePredicate;
    NSMutableArray *backArray = [NSMutableArray array];
    
    for (NSString *fieldString in fieldArray) {
        scopePredicate = [NSPredicate predicateWithFormat:@"SELF.%@ contains[c] %@", fieldString, inputString];
        NSArray *tempArray = [array filteredArrayUsingPredicate:scopePredicate];
        for (NSObject *object in tempArray) {
            if (![backArray containsObject:object]) {
                [backArray addObject:object];
            }
        }
    }
    
    return backArray;
}

+ (NSArray *)searchWithAllFieldArray:(NSArray *)allFieldArray
                         inputString:(NSString *)inputString
                          inAllArray:(NSArray *)allArray
{
    NSInteger count = allArray.count;
    
    if (allFieldArray.count != allArray.count || 0 == count) {
        return nil;
    }
    
    NSMutableArray *backArray  = [NSMutableArray array];
    
    for (NSInteger i = 0; i < count; i++) {
        NSArray *tempArray = [self searchWithFieldArray:allFieldArray[i] inputString:inputString inArray:allArray[i]];
        [backArray addObject:tempArray];
    }
    
    return backArray;
}
#pragma mark  ————— 获取汉字转成拼音字符串 通讯录模糊搜索 支持拼音检索 首字母 全拼 汉字 搜索 —————
+ (NSString *)transformToPinyin:(NSString *)aString{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    NSArray *pinyinArray = [str componentsSeparatedByString:@" "];
    NSMutableString *allString = [NSMutableString new];
    
    int count = 0;
    
    for (int  i = 0; i < pinyinArray.count; i++)
    {
        
        for(int i = 0; i < pinyinArray.count;i++)
        {
            if (i == count) {
                [allString appendString:@"#"];//区分第几个字母
            }
            [allString appendFormat:@"%@",pinyinArray[i]];
            
        }
        [allString appendString:@","];
        count ++;
        
    }
    
    NSMutableString *initialStr = [NSMutableString new];//拼音首字母
    
    for (NSString *s in pinyinArray)
    {
        if (s.length > 0)
        {
            
            [initialStr appendString:  [s substringToIndex:1]];
        }
    }
    
    [allString appendFormat:@"#%@",initialStr];
    [allString appendFormat:@",#%@",aString];
    
    return allString;
}


//-- Separator:  分割线   --------------------------------------------------->
+ (void)getFiledWithClass:(Class)class {
    unsigned int count = 0;
    
    // 拷贝出所胡的成员变量列表
    Ivar *ivars = class_copyIvarList(class, &count);
    
    for (int i = 0; i<count; i++) {
        // 取出成员变量
        Ivar ivar = *(ivars + i);
        
        // 打印成员变量名字
        NSLog(@"%s", ivar_getName(ivar));
        
        // 打印成员变量的数据类型
        NSLog(@"%s", ivar_getTypeEncoding(ivar));
    }
    
    // 释放
    free(ivars);
    
}

+ (void)getMethodWithClass:(Class)class {
    unsigned int methCount = 0;
    Method *meths = class_copyMethodList(class, &methCount);
    
    for(int i = 0; i < methCount; i++) {
        
        Method meth = meths[i];
        
        SEL sel = method_getName(meth);
        
        const char *name = sel_getName(sel);
        
        NSLog(@"%s", name);
    }
    
    free(meths);
}

+ (NSString *)getRightTimeFormatWithTotalTime:(CGFloat)totalTime {
    double minutesElapsedtotal = floor(fmod(totalTime/ 60.0,60.0));
    double secondsElapsedtotal = floor(fmod(totalTime,60.0));
    return [NSString stringWithFormat:@"%02.0f:%02.0f",minutesElapsedtotal, secondsElapsedtotal];
}
+ (NSString *)getRightTime2FormatWithTotalTime:(CGFloat)totalTime {
    double minutesElapsedtotal = floor(fmod(totalTime/ 60.0,60.0));
    double secondsElapsedtotal = floor(fmod(totalTime,60.0));
    return [NSString stringWithFormat:@"%.0f分%.0f秒",minutesElapsedtotal, secondsElapsedtotal];
}
+ (NSString *)getRightNumFormatWithTotalNum:(int)totalNum {
    if (totalNum > 10000) {
        return [NSString stringWithFormat:@"%.1f万",totalNum/10000.0];
    }else {
        return [NSString stringWithFormat:@"%d",totalNum];
    }
}


+ (NSArray *)getAllFilesFromPath:(NSString *)path {
    
    NSMutableArray *filesArr = @[].mutableCopy;
    
    // 1.判断文件还是目录
    NSFileManager * fileManger = [NSFileManager defaultManager];
    
    BOOL isDir = NO;
    
    BOOL isExist = [fileManger fileExistsAtPath:path isDirectory:&isDir];
    
    if (isExist) {
        
        // 2. 判断是不是目录
        if (isDir) {
            
            NSArray * dirArray = [fileManger contentsOfDirectoryAtPath:path error:nil];
            
            NSString * subPath = nil;
            
            for (NSString * str in dirArray) {
                
                subPath  = [path stringByAppendingPathComponent:str];
                
                BOOL issubDir = NO;
                
                [fileManger fileExistsAtPath:subPath isDirectory:&issubDir];
                
               [filesArr addObjectsFromArray:[self getAllFilesFromPath:subPath]];
                
            }
        }else{
            NSLog(@"%@",path);
            [filesArr addObject:path];
        }
    }else{
        NSLog(@"你打印的是目录或者不存在");
        
    }
    return filesArr;
}
@end
