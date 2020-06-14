//
//  JRList.m
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/12.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import "JRList.h"

@implementation JRList

-(instancetype)init
{
    self = [super init];
    if (self) {
        _listNormalTintColor = [UIColor blackColor];
        _listSelectedTintColor = [UIColor systemBlueColor];
        _listSelectedImage = [UIImage imageNamed:@"checkMark"];
        _listSelectedBgColor = [UIColor whiteColor];
        _listNormalBgColor = [UIColor whiteColor];
        _listRowHeight = 40;
        _listArr = @[@[@"需配置列表内容数组"]];
        _showOriginTitleIndexArr = [NSArray array];
    }
    return self;
}

JRPropSetFuncImplementation(JRList, UIColor *, listSelectedTintColor);
JRPropSetFuncImplementation(JRList, UIColor *, listNormalTintColor);
JRPropSetFuncImplementation(JRList, UIImage *, listSelectedImage);
JRPropSetFuncImplementation(JRList, UIColor *, listSelectedBgColor);
JRPropSetFuncImplementation(JRList, UIColor *, listNormalBgColor);
JRPropSetFuncImplementation(JRList, CGFloat  , listRowHeight);
JRPropSetFuncImplementation(JRList, NSArray *, listArr);
JRPropSetFuncImplementation(JRList, NSArray *, showOriginTitleIndexArr);

@end
