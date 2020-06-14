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

### CocoaPods 安装 (推荐)
1. 在 `Podfile` 中添加以下内容
 ```ruby
 pod 'JRDropMenu', :git => 'https://github.com/andy123234/JRDropMenu.git'
 ```

2. 执行  `pod install`  或  `pod update`。


### 手动安装
1. 将项目`Demo`中的文件夹`JRDropMenu`拖入到所需项目中.
1. 在你的项目的 `.pch` 全局宏定义文件中添加
```objective-c
#import "JRGlobalMacro.h"
```

## 正式开始使用
1. 在你的`ViewController`视图控制器文件中添加
```objective-c
#import "JRDropMenuView.h"
```
2. 创建视图`JRDropMenuView`
```objective-c
self.menuView = [[JRDropMenuView alloc] initWithFrame:CGRectMake(00, 88, [UIScreen mainScreen].bounds.size.width, 44)];
self.menuView.delegate = self;
[self.menuView createJRDropMenuViewWithOption:[self option]];
[self.view addSubview:self.menuView];

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
