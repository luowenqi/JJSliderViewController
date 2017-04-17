//
//  JJHomeVC.m
//  JJSliderViewController
//
//  Created by 罗文琦 on 2017/4/15.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "JJHomeVC.h"

@interface JJHomeVC ()

@end

@implementation JJHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI{
  
    UIButton* button = [[UIButton alloc]init];
    button.titleLabel.text = @"点我";
    button.backgroundColor = [UIColor redColor];
    
    button.frame = CGRectMake(0, 100, 50, 50);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];


}

-(void)push{

    UIViewController* newVC = [[UIViewController alloc]init];
    newVC.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:newVC animated:YES];
    
}

@end
