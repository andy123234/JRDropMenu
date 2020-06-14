//
//  JRList.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/12.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRGlobalMacro.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JRList : NSObject

/// 选中颜色
JRPropStatementAndPropSetFuncStatement(strong, JRList, UIColor *, listSelectedTintColor);
/// 未选中颜色
JRPropStatementAndPropSetFuncStatement(strong, JRList, UIColor *, listNormalTintColor);
/// 选中图片
JRPropStatementAndPropSetFuncStatement(strong, JRList, UIImage *, listSelectedImage);
/// 选中背景色
JRPropStatementAndPropSetFuncStatement(strong, JRList, UIColor *, listSelectedBgColor);
/// 未选中背景色
JRPropStatementAndPropSetFuncStatement(strong, JRList, UIColor *, listNormalBgColor);
/// 列表cell高度
JRPropStatementAndPropSetFuncStatement(assign, JRList, CGFloat  , listRowHeight);
/// 列表内容数组
JRPropStatementAndPropSetFuncStatement(copy  , JRList, NSArray *, listArr);
/// 显示原标题数组(Title ChangeTitleStyle为ChangeTitleStyleCustom时有效)
JRPropStatementAndPropSetFuncStatement(copy  , JRList, NSArray *, showOriginTitleIndexArr);


@end

NS_ASSUME_NONNULL_END
