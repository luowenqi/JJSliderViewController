//
//  JJLeftVC.m
//  JJSliderViewController
//
//  Created by 罗文琦 on 2017/4/16.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "JJLeftVC.h"
#import "JJSliderViewController.h"
#import "JJMainTabBarVC.h"
#import "AppDelegate.h"


static NSString* reuserIdentifer = @"reuserIdentifer";

@interface JJLeftVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic , strong) UITableView * tableView;

@end

@implementation JJLeftVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    self.view.backgroundColor = [UIColor redColor];
}

#pragma mark - 设置界面
-(void)setupUI{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuserIdentifer];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


#pragma mark - 实现数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuserIdentifer forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return  cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //新建一个控制器
    UIViewController *vc = [[UIViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = @"新的控制器";
    vc.view.backgroundColor = [UIColor blueColor];
    
    
    [[self getNavgationVC] pushViewController:vc animated:NO];
}


#pragma mark - 关闭本身
-(void)close{
    //要让左侧控制器收回
    JJSliderViewController *sliderVC = (JJSliderViewController *)self.parentViewController; //获取自己父控制器
    [sliderVC closeLeft];
}

#pragma mark - 获取到navigationVC
-(UINavigationController*)getNavgationVC{
    JJSliderViewController *sliderVC = (JJSliderViewController *)self.parentViewController; //获取自己父控制器
    //关闭左侧的控制器
    [sliderVC closeLeft];
    //要让右侧控制器进行push
    sliderVC.rightVC.view.transform = CGAffineTransformIdentity;
    JJMainTabBarVC *rightVC = (JJMainTabBarVC *)sliderVC.rightVC;
    //要让右侧控制器进行push
    UINavigationController *nav = rightVC.selectedViewController; //代表获取选中的那个控制器
    [[NSNotificationCenter defaultCenter] postNotificationName:@"111" object:nil userInfo:@{@"key":@(0)}];
    return nav;
}
@end

















