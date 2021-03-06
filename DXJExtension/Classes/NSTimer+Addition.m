//
//  NSTimer+Addition.m
//
//  Created by limin on 17/1/16.
//  Copyright © 2017年  All rights reserved.
//

#import "NSTimer+Addition.h"

@implementation NSTimer (Addition)
- (void)pause {
    if (!self.isValid) return;
    [self setFireDate:[NSDate distantFuture]];
}

- (void)resume {
    if (!self.isValid) return;
    [self setFireDate:[NSDate date]];
}

- (void)resumeWithTimeInterval:(NSTimeInterval)time {
    if (!self.isValid) return;
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:time]];
}

@end
