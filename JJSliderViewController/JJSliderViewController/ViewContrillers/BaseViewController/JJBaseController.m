//
//  JJBaseController.m
//  JJSliderViewController
//
//  Created by 罗文琦 on 2017/4/15.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "JJBaseController.h"

@interface JJBaseController ()

@property(nonatomic , strong) NSMutableArray<UINavigationController*> * controllers;

@end

@implementation JJBaseController



-(instancetype)init{
    if (self = [super init]) {
       
        [self setupUI];
    }
    return self;

}


#pragma mark - 设置界面
-(void)setupUI{
    
    //这里使用json的方式,持久化所有的控制器,方便以后的复用
    NSURL* jsonURL = [[NSBundle mainBundle] URLForResource:@"controller.json" withExtension:nil];
    NSData* data = [NSData dataWithContentsOfURL:jsonURL];
    //获取到json中的数组
    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //使用数组进行循环创建控制器
    [self creatViewController:jsonArray];
    
    self.viewControllers = self.controllers;
    
}


-(void)creatViewController:(NSArray*)jsonArray{
    self.controllers = [NSMutableArray arrayWithCapacity:jsonArray.count];
   
    for (NSDictionary* dict in jsonArray) {
        Class cls = NSClassFromString(dict[@"className"]);
        UIViewController* VC = [[cls alloc]init];
 
        VC.view.backgroundColor = [UIColor whiteColor];
        
        //放到导航控制器里面
        UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:VC];
        [self.controllers addObject:nav];
        //设置文字
        VC.title = dict[@"title"];
        //设置不同状态下的图片
        VC.tabBarItem.image = [[UIImage imageNamed:dict[@"imageName"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        VC.tabBarItem.selectedImage = [[UIImage imageNamed:dict[@"selectImageName"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //设置tabBar的字体颜色
        [VC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    }
}


@end
