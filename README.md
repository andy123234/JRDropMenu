# JRDropMenu

[![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/LICENSE)</br>
[![](https://img.shields.io/badge/language-OC-green.svg)](https://github.com/AAChartModel/AAChartKit)</br>

## 真机美图
| 单列表 | 标题有前缀 | 默认选中项 |
| :----:  | :----: | :----: |
| ![image1](https://github.com/andy123234/JRDropMenu/blob/master/ScreenShots/9.png) | ![image1](https://github.com/andy123234/JRDropMenu/blob/master/ScreenShots/8.png) | ![image1](https://github.com/andy123234/JRDropMenu/blob/master/ScreenShots/2.png) |

| 自定义标题样式 | 自定义列表样式 | 选中不替换标题Index |
| :----:  | :----: | :----: |
| ![image1](https://github.com/andy123234/JRDropMenu/blob/master/ScreenShots/1.png) | ![image1](https://github.com/andy123234/JRDropMenu/blob/master/ScreenShots/6.png) | ![image1](https://github.com/andy123234/JRDropMenu/blob/master/ScreenShots/10.png) |

## 使用前安装

### 手动安装
1. 将项目`Demo`中的文件夹`JRDropMenu`拖入到所需项目中.
2. 在你的项目的 `.pch` 全局宏定义文件中添加

```objective-c
#import "JRDropMenuView.h"
```

## 正式开始使用
### 1. 在你的`ViewController`视图控制器文件中添加
```objective-c
#import "JRDropMenuView.h"
```
### 2. 创建视图`JRDropMenuView`
```objective-c
self.menuView = [[JRDropMenuView alloc] initWithFrame:CGRectMake(00, 88, [UIScreen mainScreen].bounds.size.width, 44)];
self.menuView.delegate = self;
[self.menuView createJRDropMenuViewWithOption:[self option]];
[self.view addSubview:self.menuView];
```
### 3. JRCategory需包含JRTitle和JRList属性完成一列下拉菜单的配置
> JRCategory -> JRTitle + JRList =  JROption

```
- (JROption *)option
{
    JROption * option = JROption.new
   .categoryArrSet(@[
                       JRCategory.new
                       .titleSet(JRTitle.new
                                 .titleNameSet(@"标题名称")
                                 )
                       .listSet(JRList.new
                                .listArrSet(列表数组)
                                )
                     ]
                   );
   return option;
}
```
### 4. 自定义标题和列表属性
> 根据JROption,JRTitle和JRList的头文件来选择需要自定义的属性,使用点语法即可轻松完成配置
```
JROption * option = JROption.new
.categoryArrSet(@[
                    JRCategory.new
                    .titleSet(JRTitle.new
                              .titleNameSet(@"Language")
                              .titleSelectedTintColorSet([UIColor blackColor])
                              .titleNormalTintColorSet([UIColor whiteColor])
                              .titleNormalFontSet([UIFont systemFontOfSize:12])
                              .titleNormalBgColorSet([UIColor colorWithRed:6/255.0 green:26/255.0 blue:52/255.0 alpha:.8])
                              )
                    .listSet(JRList.new
                             .listArrSet(@[@"ALL",@"PHP",@"OC",@"Swift",@"Java",@"JavaScript"])
                             .listRowHeightSet(60)
                             .listNormalBgColorSet([UIColor lightGrayColor])
                             .listNormalTintColorSet([UIColor redColor])
                             )
                  ]
                )
.showIndicatorSet(NO);
return option;
```
### 5. 移除视图
> 在即将离开视图时需调用dissmiss方法,并关闭动画
```
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.menuView dismissWithAnimation:NO];
}
```
## 特别说明

### 获取点击事件结果

> 可通过给 JRDropMenuView 示例对象设置代理方法,来实现监听用户的点击事件
  
  ```
  - (void)jrDropMenuView:(JRDropMenuView *)jrDropMenuView ResultArr:(NSMutableArray <JRDropMenuItemModel *>*)resultArr;
  ```
