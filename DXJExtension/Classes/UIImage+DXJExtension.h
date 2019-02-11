//
//  UIImage+DXJExtension.h
//  CarShareDriver
//
//  Created by 董向军 on 17/5/15.
//  Copyright © 2017年 华网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DXJExtension)

/** 加载原图*/
+ (UIImage *)originImageWithName: (NSString *)name;

/** 图片拉伸*/
+ (UIImage *)imageResizableNamed:(NSString *)name;

/** 图片打水印（两个图片名称）*/
+ (UIImage *)imageWatermarkNamed:(NSString *)watermarkName named:(NSString *)name scale:(CGFloat)scale;

/** 图片添加边框*/
+ (UIImage *)imageRoundNamed:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/** 根据view生成图片*/
+ (UIImage *)imageCaptureWithView:(UIView *)view;

/** 根据颜色生成图片*/
+ (UIImage *)imageWithColor:(UIColor *)color;

/** 生成圆形图片*/
+ (UIImage *)circleImageName:(NSString *)name;

/** 改变图片的透明度*/
+ (UIImage *)changeAlpha:(CGFloat)alpha withImageName:(NSString*)imageName;


- (UIColor *)pixelColorAtLocation:(CGPoint)point;
//-- Separator:  分割线   --------------------------------------------------->

-(UIImage *)updateImageWithTintColor:(UIColor*)color;
-(UIImage *)updateImageWithTintColor:(UIColor*)color alpha:(CGFloat)alpha;
-(UIImage *)updateImageWithTintColor:(UIColor*)color rect:(CGRect)rect;
-(UIImage *)updateImageWithTintColor:(UIColor*)color insets:(UIEdgeInsets)insets;
-(UIImage *)updateImageWithTintColor:(UIColor*)color alpha:(CGFloat)alpha insets:(UIEdgeInsets)insets;
-(UIImage *)updateImageWithTintColor:(UIColor*)color alpha:(CGFloat)alpha rect:(CGRect)rect;



#pragma mark - 生成二维码的方法
/** 生成一张普通的二维码 */
+ (UIImage *)generateWithDefaultQRCodeData:(NSString *)data imageViewWidth:(CGFloat)imageViewWidth;

/** 生成一张带有logo的二维码（logoScaleToSuperView：相对于父视图的缩放比取值范围0-1；0，不显示，1，代表与父视图大小相同） */
+ (UIImage *)generateWithLogoQRCodeData:(NSString *)data logoImageName:(NSString *)logoImageName logoScaleToSuperView:(CGFloat)logoScaleToSuperView;

/** 生成一张彩色的二维码 */
+ (UIImage *)generateWithColorQRCodeData:(NSString *)data backgroundColor:(CIColor *)backgroundColor mainColor:(CIColor *)mainColor;

@end
