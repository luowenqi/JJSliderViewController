//
//  AppDelegate.h
//  JJSliderViewController
//
//  Created by 罗文琦 on 2017/4/15.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJSliderViewController.h"
#import "JJMainTabBarVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JJSliderViewController *LeftSlideVC;//侧滑视图VC
@property (strong, nonatomic) JJMainTabBarVC *mainTabBarController;//主视图TabBarVC




@end

