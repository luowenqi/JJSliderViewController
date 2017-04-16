//
//  JJSliderViewController.m
//  JJSliderViewController
//
//  Created by 罗文琦 on 2017/4/15.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "JJSliderViewController.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

@interface JJSliderViewController ()

@property (nonatomic,strong)UITapGestureRecognizer *tap;//请点手势
@property (nonatomic,strong)UIPanGestureRecognizer *pan;//拖拽手势

@end

@implementation JJSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置界面
    [self setupUI];
    self.view.backgroundColor = [UIColor greenColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removePanGesture:) name:@"111" object:nil];
}

#pragma mark - 删除手势
- (void)removePanGesture:(NSNotification *)notification
{
    BOOL gesture = [notification.userInfo[@"key"] integerValue];
    if (gesture == 1) {
        [self.rightVC.view addGestureRecognizer:self.pan];
    }
    else
    {
        [self.rightVC.view removeGestureRecognizer:self.pan];
    }
}

#pragma mark - 指定初始化方法
-(instancetype)initWithLeftVC:(UIViewController*)leftVC rightVC:(UIViewController*)rightVC{
    
    if (self = [super init]) {
        self.leftVC = leftVC;
        self.rightVC = rightVC;
    }
    return self;
}


#pragma mark - 设置界面
-(void)setupUI{
    //使用抽屉的方式把左右两侧的控制器加进去
    [self addChildViewController:_leftVC];
    [self.view addSubview:_leftVC.view];
    [_leftVC didMoveToParentViewController:self];
    
    
    [self addChildViewController:_rightVC];
    [self.view addSubview:_rightVC.view];
    [_rightVC didMoveToParentViewController:self];

    //添加拖拽手势
    self.pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(slideRightView:)];
    [self.rightVC.view addGestureRecognizer:self.pan];
}


#pragma mark - 拖拽时触发
-(void)slideRightView:(UIPanGestureRecognizer *)pan{
    //取出拖拽偏移量
    CGPoint offset = [pan translationInView:self.view];
    //清0
    [pan setTranslation:CGPointZero inView:self.view];
    //防止右侧穿帮
    if(offset.x + _rightVC.view.frame.origin.x < 0){
        //避免拖动太猛会有间隙，写代码让它回到初始位置
        _rightVC.view.transform = CGAffineTransformIdentity;
        return;
    }
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
            //访问右侧控制器
            _rightVC.view.transform = CGAffineTransformTranslate(_rightVC.view.transform, offset.x, 0);
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            
            //MARK: 滑动结束超过一半的情况
            //判断有没有超过一半
            if(_rightVC.view.frame.origin.x >= SCREENWIDTH * 0.5){
                [self showLeftWithWidth];
            }else{
                [self closeLeft];
            }
        default:
            break;
    }
}



#pragma mark - 显示左侧控制器
-(void)showLeftWithWidth{
    [UIView animateWithDuration:0.4 animations:^{
        _rightVC.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width - 64, 0);
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeLeft)];
    //添加到右侧控制器的View
    [_rightVC.view addGestureRecognizer:tap];
    //记录tap属性
    _tap = tap;
}

#pragma mark - 关闭左侧控制器
-(void)closeLeft{
    [UIView animateWithDuration:0.4 animations:^{
        _rightVC.view.transform = CGAffineTransformIdentity;
    }];
    [_rightVC.view removeGestureRecognizer:_tap];
}
@end


















