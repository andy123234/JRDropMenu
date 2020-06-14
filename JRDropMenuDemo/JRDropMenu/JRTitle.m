//
//  JRTitle.m
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/12.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import "JRTitle.h"

@implementation JRTitle

-(instancetype)init
{
    self = [super init];
    if (self) {
        _titleSelectedTintColor = [UIColor systemBlueColor];
        _titleNormalTintColor = [UIColor blackColor];
        _titleNormalFont = [UIFont systemFontOfSize:12];
        _titleSelectedFont = [UIFont systemFontOfSize:12];
        _titleNormalBgColor = [UIColor whiteColor];
        _titleSelectedBgColor = [UIColor whiteColor];
        _titleNormalImage = [UIImage imageNamed:@"down_arrow"];
        _titleSelectedImage = [UIImage imageNamed:@"up_arrow"];
        _titleName = @"需配置标题";
        _changeTitleStyle = ChangeTitleStyleAlways;
        _preTitleStr = @"";
        _defaultIndex = 0;
    }
    return self;
}

JRPropSetFuncImplementation(JRTitle, UIColor *, titleSelectedTintColor);
JRPropSetFuncImplementation(JRTitle, UIColor *, titleNormalTintColor);
JRPropSetFuncImplementation(JRTitle, UIFont  *, titleNormalFont);
JRPropSetFuncImplementation(JRTitle, UIFont  *, titleSelectedFont);
JRPropSetFuncImplementation(JRTitle, UIColor *, titleNormalBgColor);
JRPropSetFuncImplementation(JRTitle, UIColor *, titleSelectedBgColor);
JRPropSetFuncImplementation(JRTitle, UIImage *, titleSelectedImage);
JRPropSetFuncImplementation(JRTitle, UIImage *, titleNormalImage);
JRPropSetFuncImplementation(JRTitle, NSString *, titleName);
JRPropSetFuncImplementation(JRTitle, ChangeTitleStyle , changeTitleStyle);
JRPropSetFuncImplementation(JRTitle, NSString *, preTitleStr);
JRPropSetFuncImplementation(JRTitle, NSInteger , defaultIndex);

@end
