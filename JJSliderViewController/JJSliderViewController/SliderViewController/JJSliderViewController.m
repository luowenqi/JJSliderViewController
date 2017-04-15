//
//  JJSliderViewController.m
//  JJSliderViewController
//
//  Created by 罗文琦 on 2017/4/15.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "JJSliderViewController.h"

@interface JJSliderViewController ()

@end

@implementation JJSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}






-(instancetype)initWithLeftVC:(UIViewController*)leftVC rightVC:(UIViewController*)rightVC{
    if (self = [super init]) {
        self.leftVC = leftVC;
        self.rightVC = rightVC;
    }
    return self;
}



@end
