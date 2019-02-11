//
//  UIView+DXJExtension.h
////
//  Created by DXJ on 15/7/22.
//  Copyright (c) 2015年 DXJ All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^WhenTappedBlock)(void);


@interface UIView (DXJExtension)<UIGestureRecognizerDelegate>


@property (nonatomic, assign) CGSize size;
@property (nonatomic,assign) CGPoint origin;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, readonly) CGFloat middleX;
@property (nonatomic, readonly) CGFloat middleY;
@property (nonatomic, readonly) CGPoint middlePoint;


/**
 *  CGAffineTransformMakeScale  形变
 */
@property (nonatomic) CGFloat  scale;

/**
 *  CGAffineTransformMakeRotation  角度
 */
@property (nonatomic) CGFloat  angle;


/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/
#pragma mark -  判断控件是否显示在当前窗口
- (BOOL)isShowingOnWindow;

/* 判断两个view是否重叠*/
- (BOOL)intersectWithView:(UIView *)view;

+ (instancetype)dxj_viewFromXib;

- (void)removeAllSubviews;

- (void)whenTapped:(WhenTappedBlock)block;

- (void)whenDoubleTapped:(WhenTappedBlock)block;

- (void)whenTwoFingerTapped:(WhenTappedBlock)block;

- (void)whenTouchedDown:(WhenTappedBlock)block;

- (void)whenTouchedMove:(WhenTappedBlock)block;

- (void)whenTouchedUp:(WhenTappedBlock)block;

- (void)loomingAnimationWithDuration:(CGFloat)duration;


/**
 *  ----------------------------------自定义边框---------------------------------------------
 */

- (void)makeBorderWithConrner:(UIRectCorner)corner AndCornerRadii:(CGSize)size;

@end
