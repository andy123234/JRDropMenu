//
//  JROption.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/12.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JRGlobalMacro.h"
#import "JRCategory.h"
#import "JRTitle.h"
#import "JRList.h"

NS_ASSUME_NONNULL_BEGIN

@interface JROption : NSObject

/// 标题配置
JRPropStatementAndPropSetFuncStatement(copy, JROption, NSArray *, categoryArr);
/// 是否显示BottomIndicator
JRPropStatementAndPropSetFuncStatement(assign, JROption, BOOL    , showIndicator);
JRPropStatementAndPropSetFuncStatement(strong, JROption, UIColor *, indicatorColor);
/// 设置圆角
JRPropStatementAndPropSetFuncStatement(assign, JROption, CGFloat  , indicatorHeight);
/// 是否显示BottomSeparatLine
JRPropStatementAndPropSetFuncStatement(assign, JROption, BOOL    , showBottomLine);
/// 遮罩颜色
JRPropStatementAndPropSetFuncStatement(strong, JROption, UIColor *, maskColor);
/// 设置圆角
JRPropStatementAndPropSetFuncStatement(assign, JROption, CGFloat  , cornerRadius);

@end

NS_ASSUME_NONNULL_END
