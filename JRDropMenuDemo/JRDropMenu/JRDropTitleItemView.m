//
//  JRDropTitleItemView.m
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/1.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import "JRDropTitleItemView.h"

@implementation JRDropTitleItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isSelected = NO;
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self addSubview:self.titleLabel];
    [self addSubview:self.arrowImg];
//    [self layoutSubviews];
}
-(void)setText:(NSString *)text
{
    if (_title.changeTitleStyle == ChangeTitleStyleNever) {
        _titleLabel.text = [NSString stringWithFormat:@"%@%@",self.title.preTitleStr,_title.titleName];
    }else{
        _titleLabel.text = [NSString stringWithFormat:@"%@%@",self.title.preTitleStr,text];
    }
    [_titleLabel sizeToFit];
    _titleLabel.center = CGPointMake(CGRectGetMidX(self.frame) - self.frame.origin.x, CGRectGetMidY(self.frame));
    
    _arrowImg.frame = CGRectMake(CGRectGetMaxX(_titleLabel.frame) + 5, CGRectGetMidY(self.frame) - 3, 8, 6);
    [self layoutIfNeeded];
}
-(void)setTitle:(JRTitle *)title
{
    _title = title;
    
    _titleLabel.font = title.titleNormalFont;
    _titleLabel.textColor = title.titleNormalTintColor;
    _arrowImg.tintColor = title.titleNormalTintColor;
    self.backgroundColor = title.titleNormalBgColor;
}
-(void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    
    if (_isSelected) {
        _titleLabel.textColor = self.title.titleSelectedTintColor;
        _arrowImg.image = [self.title.titleSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _arrowImg.tintColor = self.title.titleSelectedTintColor;
    }else{
        _titleLabel.textColor = self.title.titleNormalTintColor;
        _arrowImg.image = [self.title.titleNormalImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _arrowImg.tintColor = self.title.titleNormalTintColor;
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_delegate && [_delegate respondsToSelector:@selector(didClickTitleInJRDropTitleItemView:)]) {
        self.isSelected = !self.isSelected;
        [_delegate didClickTitleInJRDropTitleItemView:self];
    }
}
#pragma mark - lazy
-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UIImageView *)arrowImg
{
    if (!_arrowImg) {
        _arrowImg = [UIImageView new];
        _arrowImg.image = [UIImage imageNamed:@"down_arrow"];
    }
    return _arrowImg;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
