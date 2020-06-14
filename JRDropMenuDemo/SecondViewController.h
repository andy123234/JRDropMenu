//
//  SecondViewController.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/14.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRDropMenuView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JRDropMenuType) {
    JRDropMenuTypePre,
    JRDropMenuTypeDefault,
    JRDropMenuTypeMultiple,
    JRDropMenuTypeTitleCustom,
    JRDropMenuTypeListCustom,
    JRDropMenuTypeListShowOrigin
};

@interface SecondViewController : UIViewController<JRDropMenuDelegate>

@property (nonatomic , assign) JRDropMenuType menuType;

@end

NS_ASSUME_NONNULL_END
