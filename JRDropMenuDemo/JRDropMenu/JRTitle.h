//
//  JRTitle.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/12.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JRGlobalMacro.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ChangeTitleStyle) {
    ChangeTitleStyleAlways,  //替换标题为选项
    ChangeTitleStyleNever,   //不替换标题为选项
    ChangeTitleStyleCustom,  //自定义选项是否需要替换标题
};

@interface JRTitle : NSObject

/// 选中颜色
JRPropStatementAndPropSetFuncStatement(strong, JRTitle, UIColor *, titleSelectedTintColor);

/// 未选中颜色
JRPropStatementAndPropSetFuncStatement(strong, JRTitle, UIColor *, titleNormalTintColor);

/// 未选中字体
JRPropStatementAndPropSetFuncStatement(strong, JRTitle, UIFont * , titleNormalFont);

/// 选中字体
JRPropStatementAndPropSetFuncStatement(strong, JRTitle, UIFont * , titleSelectedFont);

/// 未选中背景色
JRPropStatementAndPropSetFuncStatement(strong, JRTitle, UIColor *, titleNormalBgColor);

/// 选中背景色
JRPropStatementAndPropSetFuncStatement(strong, JRTitle, UIColor *, titleSelectedBgColor);

/// 选中图标
JRPropStatementAndPropSetFuncStatement(strong, JRTitle, UIImage *, titleSelectedImage);

/// 未选中图标
JRPropStatementAndPropSetFuncStatement(strong, JRTitle, UIImage *, titleNormalImage);

/// 标题内容
JRPropStatementAndPropSetFuncStatement(copy, JRTitle, NSString *, titleName);

/// 是否根据选项修改标题
JRPropStatementAndPropSetFuncStatement(assign, JRTitle, ChangeTitleStyle , changeTitleStyle);

/// 标题前缀
JRPropStatementAndPropSetFuncStatement(copy, JRTitle, NSString * , preTitleStr);

/// 默认选中
JRPropStatementAndPropSetFuncStatement(assign  , JRTitle, NSInteger , defaultIndex);

@end

NS_ASSUME_NONNULL_END
