//
//  JRDropMenuItemModel.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/1.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface JRDropMenuItemModel : NSObject

@property (nonatomic , copy) NSString * title;
@property (nonatomic , assign) BOOL isSelected;
@property (nonatomic , assign) NSInteger index;

@property (nonatomic , assign) BOOL shouldShowOriginTitle;

@end

NS_ASSUME_NONNULL_END
