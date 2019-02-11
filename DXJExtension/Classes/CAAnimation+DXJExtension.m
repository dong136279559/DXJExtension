//
//  CAAnimation+DXJExtension.m
//  CarShareDriver
//
//  Created by 董向军 on 17/6/5.
//  Copyright © 2017年 华网. All rights reserved.
//

#import "CAAnimation+DXJExtension.h"



@implementation CAAnimation (DXJExtension)

+ (CAAnimation *)animationShakeWithLayer:(CALayer *)layer xy:(NSString *)direction repeatCount:(CGFloat)count {
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animation];
    animation.keyPath     = [NSString stringWithFormat:@"position.%@",direction ? direction : @"x"];
    animation.values      = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes    = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration    = 0.25f;
    animation.repeatCount = count ? count : 1;
    animation.additive    = YES;
    [layer addAnimation:animation forKey:@"shake"];
    return animation;
}

+ (CAAnimation *)animationRotateWithLayer:(CALayer *)layer repeatCount:(CGFloat)count {
    
    CABasicAnimation * animation = [CABasicAnimation animation];
    animation.keyPath        = @"transform.rotation.z";
    animation.toValue        = @(2 * M_PI);
    animation.duration       = 2.0f;
    animation.repeatCount    = count ? count : 1;
    [layer addAnimation:animation forKey:@"rotate"];
    return animation;
}

+ (CAAnimation *)animationTransitionWithLayer:(CALayer *)layer transitionType:(NSString *)type transitionSubtype:(NSString *)subtype {
    
    CATransition * animation = [CATransition animation];
    animation.type           = type;
    animation.subtype        = subtype;
    animation.duration       = 0.4f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer addAnimation:animation forKey:@"transition"];
    return animation;
}

+ (CAAnimation *)animationPopWithLayer:(CALayer *)layer {
    
    CAKeyframeAnimation * pop = [CAKeyframeAnimation animation];
    pop.keyPath     = @"transform.scale";
    pop.values      = @[@0.1, @0.2, @0.3, @0.2, @0.1];
    pop.additive    = YES;
    
    CAAnimationGroup * group = [CAAnimationGroup new];
    group.animations = @[pop];
    group.duration = .25;
    group.removedOnCompletion = NO;
    [layer addAnimation:group forKey:nil];
    return group;
}

+ (CAAnimation *)animationScaleWithLayer:(CALayer *)layer {

    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.50;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.4, 1.4, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [layer addAnimation:animation forKey:nil];

    return animation;
}
/**
 设置圆角动画
 
 @param layer  动画的layer
 @param radius 圆角半径
 */
+ (CASpringAnimation *)animationRoundCornersWithCALayer:(CALayer*)layer toRadius:(CGFloat)radius {
    CASpringAnimation *radiusAnimation     = [CASpringAnimation animationWithKeyPath:@"cornerRadius"];
    radiusAnimation.fromValue             = @(layer.cornerRadius);
    radiusAnimation.toValue               = @(radius);
    
    //settlingDuration结算时间
    radiusAnimation.duration              = radiusAnimation.settlingDuration;
    radiusAnimation.damping               = 17.;
    [layer addAnimation:radiusAnimation forKey:nil];
    layer.cornerRadius                    = radius;
    return radiusAnimation;
}

/**
 动画来改变layer的背景颜色
 
 @param layer   改变的layer
 @param toColor 改变的颜色
 */
+ (CASpringAnimation *)animationColorWithCALayer:(CALayer*)layer toColor:(UIColor*)toColor{
    CASpringAnimation *tintAnimation    = [CASpringAnimation animationWithKeyPath:@"backgroundColor"];
    tintAnimation.fromValue            = (__bridge id _Nullable)(layer.backgroundColor);
    tintAnimation.toValue              = (__bridge id _Nullable)(toColor.CGColor);
    
    //settlingDuration结算时间
    tintAnimation.duration             = tintAnimation.settlingDuration;
    
    //阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    tintAnimation.damping              = 7.;
    
    //附着在弹簧末端的物体的质量。必须大超过0。默认为一。
    tintAnimation.mass                 = 10.;
    
    [layer addAnimation:tintAnimation forKey:nil];
    layer.backgroundColor              = toColor.CGColor;
    
    return tintAnimation;
}

+ (CABasicAnimation *)opacityForever_Animation:(float)time
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];//必须写opacity才行。
    animation.fromValue = @1.f;
    animation.toValue = @0;//这是透明度。
    animation.autoreverses = YES; //
    animation.duration = time;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    //定义动画的样式 渐入式   timingFunction 控制动画运行的节奏
    animation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    return animation;
    
}

//波浪动画
- (CALayer *)waveAnimationWithView:(UIView *)view WaveColor:(UIColor *)color duration:(CGFloat)duration NeedRepeat:(BOOL)repeat{
    CALayer *waveLayer = [CALayer layer];
    waveLayer.bounds = CGRectMake(0, 0, view.width *1.5, view.width *1.5);
    waveLayer.cornerRadius = waveLayer.bounds.size.width / 2; //设置圆角变为圆形
    waveLayer.position = view.center;
    waveLayer.backgroundColor = color.CGColor;
    [view.superview.layer insertSublayer:waveLayer below:view.layer];//把扩散层放到播放按钮下面
    
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = duration;
    animationGroup.repeatCount = repeat?INFINITY:0; //重复无限次
    animationGroup.removedOnCompletion = YES;
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    animationGroup.timingFunction = defaultCurve;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @0.7; //开始的大小
    scaleAnimation.toValue = @1.0; //最后的大小
    scaleAnimation.duration = duration;
    scaleAnimation.removedOnCompletion = NO;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @0.4; //开始的大小
    opacityAnimation.toValue = @0.0; //最后的大小
    opacityAnimation.duration = duration;
    opacityAnimation.removedOnCompletion = YES;
    
    animationGroup.animations = @[scaleAnimation, opacityAnimation];
    [waveLayer addAnimation:animationGroup forKey:@""];
    
    return waveLayer;
}

@end
