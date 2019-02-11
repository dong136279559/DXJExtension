//
//  UIViewController+Loading.m
//  NeiHan
//
//  Created by Charles on 16/5/15.
//  Copyright © 2016年 Com.Charles. All rights reserved.
//

#import "UIViewController+Loading.h"
#import <objc/message.h>
#import "UIFont+DXJExtension.h"
#import "UIColor+DXJExtension.h"
#import "UIView+DXJExtension.h"

const static char loadingViewKey;

@interface UIViewControllerLodingView : UIView
@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIActivityIndicatorView *indicatorView;
/** loadingView  */
@property(weak,nonatomic)UIView *loadingView;

@end

@implementation UIViewControllerLodingView

- (UILabel *)label {
    if (!_label) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont HeitiSCWithFontSize:14.f];
        label.textColor = [UIColor whiteColor];
        label.text = @"正在加载...";
        [self.loadingView addSubview:label];
        _label = label;
    }
    return _label;
}

- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [self.loadingView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

- (UIView *)loadingView {
    if (!_loadingView) {
        UIView *load = [[UIView alloc]init];
        load.backgroundColor = [UIColor customGrayColor];
        load.layer.cornerRadius = 1;
        load.layer.masksToBounds = YES;
        _loadingView = load;
        [self addSubview:load];

    }
    return _loadingView;
}
- (void)startAnimating {
    [self.indicatorView startAnimating];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.right.bottom.offset(-10);
        make.left.equalTo(self.indicatorView.mas_right).offset(10);
    }];
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.left.offset(10);
    }];

}
@end

@implementation UIViewController (Loading)

- (void)showLoadingView {
    [self showLoadingViewWithFrame:CGRectMake(0, 0, 260, 45) WithTitle:@"正在加载..."];
}

- (void)showLoadingViewWithFrame:(CGRect)frame WithTitle:(NSString *)title{
    if (!self.loadingView) {
        UIViewControllerLodingView *loadingView = [[UIViewControllerLodingView alloc]init];
        self.loadingView = loadingView;
        loadingView.frame = frame;
        [self.view addSubview:self.loadingView];
        loadingView.label.text = title;
        loadingView.centerX = MYCONTENTVIEWWIDTH * .5;
        loadingView.centerY = self.view.centerY - 50;
        [loadingView startAnimating];
    }
}
- (void)showLoadingViewWithFrame:(CGRect)frame {
    [self showLoadingViewWithFrame:frame WithTitle:@"正在加载..."];
}
- (void)showLoadingViewWithMsg:(NSString *)msg {
    [self showLoadingViewWithFrame:CGRectMake(0, 0, 260, 45) WithTitle:msg];
}

- (void)hideLoadingView {
    if (self.loadingView) {
        [self.loadingView removeFromSuperview];
    }
}

- (void)showTopMessage:(NSString *)msg {
    CGFloat padding = 10;
    
    UILabel *label = [UILabel new];
    label.text = msg;
    label.font = [UIFont HYQiHeiWithFontSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor lightGrayColor];
    label.width = self.view.width;
    label.height = [msg heightForFont:label.font width:label.width] + 2 * padding;
    
    label.bottom =  0  ;
    [self.view addSubview:label];
    [UIView animateWithDuration:0.3 animations:^{
        label.top =  0 ;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            label.bottom =  0 ;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}


- (UIView *)loadingView {
    return objc_getAssociatedObject(self, &loadingViewKey);
}
- (void)setLoadingView:(UIView *)loadingView {
    objc_setAssociatedObject(self, &loadingViewKey, loadingView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
