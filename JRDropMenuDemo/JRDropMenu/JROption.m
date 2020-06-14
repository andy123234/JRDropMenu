//
//  JROption.m
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/12.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import "JROption.h"

@implementation JROption

-(instancetype)init
{
    self = [super init];
    if (self) {
        _categoryArr = @[JRCategory.new];
        _showIndicator = YES;
        _indicatorHeight = 1;
        _indicatorColor = [UIColor systemBlueColor];
        _showBottomLine = YES;
        _maskColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.6];
    }
    return self;
}

JRPropSetFuncImplementation(JROption, NSArray *, categoryArr);
JRPropSetFuncImplementation(JROption, BOOL     , showIndicator);
JRPropSetFuncImplementation(JROption, UIColor *, indicatorColor);
JRPropSetFuncImplementation(JROption, CGFloat  , indicatorHeight);
JRPropSetFuncImplementation(JROption, BOOL     , showBottomLine);
JRPropSetFuncImplementation(JROption, UIColor *, maskColor);
JRPropSetFuncImplementation(JROption, CGFloat  , cornerRadius);

@end
