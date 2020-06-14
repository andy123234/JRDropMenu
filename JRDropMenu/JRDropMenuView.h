//
//  JRDropMenuView.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/1.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JRDropMenuItemModel.h"
#import "JRDropTitleItemView.h"
#import "JROption.h"

@class JRDropMenuView;

NS_ASSUME_NONNULL_BEGIN

@protocol JRDropMenuDelegate <NSObject>

- (void)jrDropMenuView:(JRDropMenuView *)jrDropMenuView ResultArr:(NSMutableArray <JRDropMenuItemModel *>*)resultArr;

@end

@interface JRDropMenuView : UIView<UITableViewDataSource,UITableViewDelegate,JRDropTitleItemViewDelegate>


@property (nonatomic , weak) id<JRDropMenuDelegate>delegate;

@property (nonatomic , strong) UIStackView * stackView;//标题stackView
@property (nonatomic , strong) UITableView * listTable;
@property (nonatomic , strong) UIView * bottomIndicator;
@property (nonatomic , strong) UIView * bottomSeparatLine;
@property (nonatomic , strong) UIView * maskBgView;

@property (nonatomic , strong) JROption * jrOption;

- (void)createJRDropMenuViewWithOption:(JROption *)option;

//刷新数据
- (void)reloadData;
/// 收回tableview
/// @param animation 是否需要动画
- (void)dismissWithAnimation:(BOOL)animation;

@end

NS_ASSUME_NONNULL_END
