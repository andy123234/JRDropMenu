//
//  JRCategory.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/13.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRTitle.h"
#import "JRList.h"

NS_ASSUME_NONNULL_BEGIN

@interface JRCategory : NSObject

/// 标题
JRPropStatementAndPropSetFuncStatement(strong, JRCategory, JRTitle *, title);
/// 列表
JRPropStatementAndPropSetFuncStatement(strong, JRCategory, JRList *, list);

@end

NS_ASSUME_NONNULL_END
