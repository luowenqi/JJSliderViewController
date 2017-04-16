//
//  JJSliderViewController.h
//  JJSliderViewController
//
//  Created by 罗文琦 on 2017/4/15.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import <UIKit/UIKit.h>





@interface JJSliderViewController : UIViewController


/**
 左侧控制器
 */
@property(nonatomic , strong) UIViewController * leftVC;


/**
 右侧控制器
 */
@property(nonatomic , strong) UIViewController * rightVC;


/**
 指定初始化方法
 */
-(instancetype)initWithLeftVC:(UIViewController*)leftVC rightVC:(UIViewController*)rightVC;

-(void)closeLeft;

-(void)showLeftWithWidth;


@end
