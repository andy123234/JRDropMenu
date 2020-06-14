//
//  JRDropMenuCell.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/1.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRDropMenuItemModel.h"
#import "JROption.h"

NS_ASSUME_NONNULL_BEGIN

@interface JRDropMenuCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *checkMarkImg;
@property (weak, nonatomic) IBOutlet UIView *dividingLine;


@property (nonatomic , strong) JRList * list;

@property (nonatomic , strong) JRDropMenuItemModel * model;

@end

NS_ASSUME_NONNULL_END
