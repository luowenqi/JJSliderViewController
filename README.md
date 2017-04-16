# JJSliderViewController
侧滑框架,一句实现,内存安全,只用了100行不到的代码,就完成实现,精简,轻量化,简洁不简单

> 使用方法
*  1  在AppDelegate中 引入头文件
```
#import "JJMainTabBarVC.h"
#import "JJSliderViewController.h"
#import "JJLeftVC.h"
```
*  2创建左侧,右侧控制器,并且把侧滑控制器作为根控制器

```
JJMainTabBarVC* mainTabBarVC = [[JJMainTabBarVC alloc]init];
JJSliderViewController* sliderVC = [[JJSliderViewController alloc]initWithLeftVC:leftVC rightVC:mainTabBarVC];    
self.window.rootViewController = sliderVC;
```


*  3.左侧控制器push的方式
```
创建控制器,然后实现下面方法
[[self getNavgationVC] pushViewController:vc animated:NO];
```



## 优势
- [x] 纯原生,框架内存稳定在25-26M之间,安全
- [x] 初始化方式极为简单,左侧控制器push方式也是一句实现
- [x] 集成了经典框架,大部分情况下可以直接使用而不做任何更改
- [x] 只用了100行不到的代码,就完成实现,精简,轻量化,简洁不简单

## 如何更改主页显示的控制器
* 框架使用了加载本地json方式创建控制器,所以想要更改子控制器,只需要在controller.json中更改对应的字段就好,而不需要要引入任何其他的头文件

### 效果1
![image](https://github.com/luowenqi/JJSliderViewController/blob/master/JJSliderViewController/JJSliderViewController/Screenshot/QQ20170416-230303.png)

## 效果2
![image](https://github.com/luowenqi/JJSliderViewController/blob/master/JJSliderViewController/JJSliderViewController/Screenshot/QQ20170416-230412.png)

## 快速更换功能模块
![image](https://github.com/luowenqi/JJSliderViewController/blob/master/JJSliderViewController/JJSliderViewController/Screenshot/QQ20170416-230521.png)
