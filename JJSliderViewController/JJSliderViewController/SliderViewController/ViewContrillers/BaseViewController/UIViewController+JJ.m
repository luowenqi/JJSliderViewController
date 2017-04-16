//
//  UIViewController+JJ.m
//  JJSliderViewController
//
//  Created by 罗文琦 on 2017/4/16.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "UIViewController+JJ.h"

@implementation UIViewController (JJ)

- (void)viewDidAppear:(BOOL)animated
{
    if (self.navigationController.viewControllers.count == 1) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"111" object:nil userInfo:@{@"key":@(1)}];
    }
}

@end
