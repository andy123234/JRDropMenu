//
//  JRDropMenuCell.m
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/1.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import "JRDropMenuCell.h"

@implementation JRDropMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(JRDropMenuItemModel *)model
{
    _model = model;
    
    _titleLabel.text = model.title;
    _checkMarkImg.image = self.list.listSelectedImage;
    
    if (model.isSelected) {
        self.backgroundColor = self.list.listSelectedBgColor;
        _titleLabel.textColor = self.list.listSelectedTintColor;
        _checkMarkImg.hidden = NO;
    }else{
        self.backgroundColor = self.list.listNormalBgColor;
        _titleLabel.textColor = self.list.listNormalTintColor;
        _checkMarkImg.hidden = YES;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
