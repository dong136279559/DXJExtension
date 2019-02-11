//
//  UIControl+DXJExtension.m
//  sxy618-iOS
//
//  Created by 董向军 on 2018/8/6.
//  Copyright © 2018年 董向军. All rights reserved.
//

#import "UIControl+DXJExtension.h"
#import <objc/runtime.h>

@interface UIControl ()

/** 是否忽略点击 */
@property(nonatomic)BOOL dxj_ignoreEvent;

@end

@implementation UIControl (DXJExtension)
+(void)load{
    Method sys_Method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method add_Method = class_getInstanceMethod(self, @selector(dxj_sendAction:to:forEvent:));
    method_exchangeImplementations(sys_Method, add_Method);
}

-(void)dxj_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    if (self.dxj_ignoreEvent) return;
    
    if (self.dxj_acceptEventInterval > 0) {
        self.dxj_ignoreEvent = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.dxj_acceptEventInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.dxj_ignoreEvent = NO;
        });
    }
    [self dxj_sendAction:action to:target forEvent:event];
}

-(void)setDxj_ignoreEvent:(BOOL)dxj_ignoreEvent{
    objc_setAssociatedObject(self, @selector(dxj_ignoreEvent), @(dxj_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)dxj_ignoreEvent{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

-(void)setDxj_acceptEventInterval:(NSTimeInterval)dxj_acceptEventInterval{
    objc_setAssociatedObject(self, @selector(dxj_acceptEventInterval), @(dxj_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSTimeInterval)dxj_acceptEventInterval{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}


@end
