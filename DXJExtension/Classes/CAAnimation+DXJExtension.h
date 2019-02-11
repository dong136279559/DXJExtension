//
//  CAAnimation+DXJExtension.h
//  CarShareDriver
//
//  Created by 董向军 on 17/6/5.
//  Copyright © 2017年 华网. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (DXJExtension)

+ (CAAnimation *)animationShakeWithLayer:(CALayer *)layer xy:(NSString *)direction repeatCount:(CGFloat)count;

+ (CAAnimation *)animationRotateWithLayer:(CALayer *)layer repeatCount:(CGFloat)count;

/* type: pageCurl,pageUnCurl,rippleEffect,suckEffect,cube,oglFlip */
+ (CAAnimation *)animationTransitionWithLayer:(CALayer *)layer
                               transitionType:(NSString *)type
                            transitionSubtype:(NSString *)subtype;

/* 动画加了pop效果*/
+ (CAAnimation *)animationPopWithLayer:(CALayer *)layer;

+ (CAAnimation *)animationScaleWithLayer:(CALayer *)layer;

/* 波纹扩散动画 */
- (CALayer *)waveAnimationWithView:(UIView *)view WaveColor:(UIColor *)color duration:(CGFloat)duration NeedRepeat:(BOOL)repeat;


/**
 动画来改变layer的背景颜色 ios 9 之后
 
 @param layer   改变的layer
 @param toColor 改变的颜色
 */
+ (CASpringAnimation *)animationColorWithCALayer:(CALayer*)layer toColor:(UIColor*)toColor  API_AVAILABLE(ios(9.0));

/**
 设置圆角动画
 
 @param layer  动画的layer
 @param radius 圆角半径
 */
+ (CASpringAnimation *)animationRoundCornersWithCALayer:(CALayer*)layer toRadius:(CGFloat)radius API_AVAILABLE(ios(9.0));

// === 永久闪烁的动画 ======
+ (CABasicAnimation *)opacityForever_Animation:(float)time ;

@end
