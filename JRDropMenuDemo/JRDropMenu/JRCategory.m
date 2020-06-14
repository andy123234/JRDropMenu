//
//  JRCategory.m
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/13.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import "JRCategory.h"

@implementation JRCategory

-(instancetype)init
{
    self = [super init];
    if (self) {
        _title = JRTitle.new;
        _list = JRList.new;
    }
    return self;
}

JRPropSetFuncImplementation(JRCategory, JRTitle *, title);
JRPropSetFuncImplementation(JRCategory, JRList *, list);

@end
