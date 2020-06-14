//
//  JRDropTitleItemView.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/1.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JROption.h"

NS_ASSUME_NONNULL_BEGIN
@class JRDropTitleItemView;

@protocol JRDropTitleItemViewDelegate <NSObject>

- (void)didClickTitleInJRDropTitleItemView:(JRDropTitleItemView *)itemView;

@end

@interface JRDropTitleItemView : UIView

@property (nonatomic , strong) UILabel * titleLabel;
@property (nonatomic , strong) UIImageView * arrowImg;

@property (nonatomic , strong) JRTitle * title;

@property (nonatomic , assign) BOOL isSelected;

@property (nonatomic , weak) id<JRDropTitleItemViewDelegate>delegate;

- (void)setText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
