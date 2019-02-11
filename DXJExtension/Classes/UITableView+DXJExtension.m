//
//  UITableView+DXJExtension.m
//  sxy618-iOS
//
//  Created by 董向军 on 2018/10/23.
//  Copyright © 2018年 河北学海优学教育科技有限公司. All rights reserved.
//

#import "UITableView+DXJExtension.h"

@implementation UITableView (DXJExtension)

+ (void)load {
    // iOS 11 UITableView reloadData 视图漂移或者闪动解决方法
    UITableView *table = [UITableView appearance];
    table.estimatedRowHeight = 0;
    table.estimatedSectionHeaderHeight = 0;
    table.estimatedSectionFooterHeight = 0;
}


@end
