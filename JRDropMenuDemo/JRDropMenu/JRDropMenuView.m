//
//  JRDropMenuView.m
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/1.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import "JRDropMenuView.h"
#import "JRDropMenuCell.h"

static float titleWidth;
static float titleHeight;

@interface JRDropMenuView()

@property (nonatomic , strong) NSMutableArray * subViews;//标题views
@property (nonatomic , strong) NSMutableArray * titlesArr;//标题数组
@property (nonatomic , strong) NSMutableArray * itemsArr;//当前列表数组
@property (nonatomic , assign) NSInteger curIndex;
@property (nonatomic , strong) NSMutableArray * columnContentArr;//每列数据
@property (nonatomic , strong) NSMutableArray<JRDropMenuItemModel *> * resultArr;//结果数组

@end


@implementation JRDropMenuView

- (void)createJRDropMenuViewWithOption:(JROption *)option
{
    self.jrOption = option;
    
    if (option.cornerRadius) {
        self.layer.cornerRadius = option.cornerRadius;
        self.layer.masksToBounds = YES;
    }
    self.curIndex = -1;
    
    [self reloadData];
}
- (void)reloadData
{
    [self.subViews removeAllObjects];
    [self.resultArr removeAllObjects];
    [self.columnContentArr removeAllObjects];
    
    titleWidth = self.frame.size.width/self.jrOption.categoryArr.count;
    titleHeight = self.frame.size.height;
    
    for (int i = 0; i < self.jrOption.categoryArr.count; i++) {
        //设置标题
        JRCategory * category = self.jrOption.categoryArr[i];
        JRTitle * title = category.title;
        JRList * list = category.list;
        
        JRDropTitleItemView * itemView = [[JRDropTitleItemView alloc] initWithFrame:CGRectMake(0, 0, titleWidth, titleHeight)];
        itemView.title = title;
        if (title.defaultIndex != 0) {//默认选中
            [itemView setText:list.listArr[title.defaultIndex]];
        }else{
            [itemView setText:title.titleName];
        }
        itemView.delegate = self;
        [self.subViews addObject:itemView];
        
        //结果数组
        JRDropMenuItemModel * resultModel = [JRDropMenuItemModel new];
        resultModel.title = list.listArr[title.defaultIndex];
        resultModel.index = title.defaultIndex;
        [self.resultArr addObject:resultModel];
        
        //设置列表
        NSMutableArray * contentArr = [NSMutableArray array];
        for (int j = 0; j < list.listArr.count; j++){//重置当前列表数据
           JRDropMenuItemModel * model = [JRDropMenuItemModel new];
           model.title = list.listArr[j];
           model.index = j;
           model.isSelected = NO;
            if ([category.list.showOriginTitleIndexArr containsObject:@(j)]) {
                model.shouldShowOriginTitle = YES;
            }else{
                model.shouldShowOriginTitle = NO;
            }
           JRDropMenuItemModel * curResultModel = _resultArr[i];
           if (curResultModel.index == j) {
               model.isSelected = YES;
           }
           [contentArr addObject:model];
         }
       [self.columnContentArr addObject:contentArr];
    }
    
    [self setupTitleStackView];//配置标题stackView
    
}
- (void)setupTitleStackView
{
    if (self.stackView.superview) {
        [self.stackView removeFromSuperview];
    }
    self.stackView = [[UIStackView alloc] initWithArrangedSubviews:self.subViews];
    _stackView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _stackView.axis = UILayoutConstraintAxisHorizontal;
    _stackView.spacing = .1;
    _stackView.distribution = UIStackViewDistributionFillEqually;
    
    [self addSubview:_stackView];
    if (self.jrOption.showIndicator) {
        if (self.bottomIndicator.superview) {
            [self.bottomIndicator removeFromSuperview];
        }
        [self addSubview:self.bottomIndicator];
    }
    if (self.jrOption.showBottomLine) {
        if (self.bottomSeparatLine.superview) {
            [self.bottomSeparatLine removeFromSuperview];
        }
        [self addSubview:self.bottomSeparatLine];
    }
}
- (void)setupTableView
{
    if (self.maskBgView.superview == nil) {
        [[UIApplication sharedApplication].keyWindow addSubview:self.maskBgView];
    }
    if (self.listTable.superview == nil) {
        [[UIApplication sharedApplication].keyWindow addSubview:self.listTable];
    }
}
- (void)show
{
    [self setupTableView];//配置tableview
    
    if (self.bottomIndicator.isHidden) {
        self.bottomIndicator.hidden = NO;
        self.bottomIndicator.frame = CGRectMake(_curIndex * titleWidth + 10, titleHeight - 1 - self.jrOption.indicatorHeight, titleWidth - 20, self.jrOption.indicatorHeight);
    }
    self.maskBgView.hidden = NO;
    [UIView animateWithDuration:.25 animations:^{
        self.bottomIndicator.frame = CGRectMake(self.curIndex * titleWidth + 10, titleHeight - 1 - self.jrOption.indicatorHeight, titleWidth - 20, self.jrOption.indicatorHeight);
        
        JRCategory * category = self.jrOption.categoryArr[self.curIndex];
        self.listTable.frame = CGRectMake(self.frame.origin.x, CGRectGetMaxY(self.frame), self.frame.size.width, category.list.listRowHeight * self.itemsArr.count);
        self.maskBgView.alpha = 1;
        
    } completion:^(BOOL finished) {
        
    }];
}
- (void)dismissWithAnimation:(BOOL)animation
{
    if (_curIndex != -1) {
        JRDropTitleItemView * lastView = self.subViews[_curIndex];
        lastView.isSelected = NO;
    }
    
    _curIndex = -1;
    self.bottomIndicator.hidden = YES;
    
    if (animation) {
        [UIView animateWithDuration:.25 animations:^{
            self.listTable.frame = CGRectMake(self.frame.origin.x, CGRectGetMaxY(self.frame), self.frame.size.width, 0);
            
            self.maskBgView.alpha = 0;
        } completion:^(BOOL finished) {
            self.maskBgView.hidden = YES;
        }];
    }else{
        self.listTable.frame = CGRectMake(self.frame.origin.x, CGRectGetMaxY(self.frame), self.frame.size.width, 0);
        self.maskBgView.hidden = YES;
    }
    
}
#pragma mark - DataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.curIndex >= 0) {
        JRCategory * category = self.jrOption.categoryArr[self.curIndex];
        return category.list.listRowHeight;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.curIndex >= 0) {
       JRCategory * category = self.jrOption.categoryArr[self.curIndex];
        return category.list.listArr.count;
    }
    return 0;
}
#pragma mark - Delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JRCategory * category = self.jrOption.categoryArr[self.curIndex];
    
    JRDropMenuCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JRDropMenuCell class])];
    cell.list = category.list;
    cell.model = self.itemsArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JRDropMenuItemModel * lastModel = self.resultArr[_curIndex];
    if (lastModel.index == indexPath.row) {//点击的为之前选中的item
        [self dismissWithAnimation:YES];
        return;
    }
    
    JRDropMenuItemModel * model = self.itemsArr[indexPath.row];
    model.isSelected = YES;
    
    JRDropMenuItemModel * lastListModel = self.itemsArr[lastModel.index];
    lastListModel.isSelected = NO;
    
    self.resultArr[_curIndex] = model;//记录结果
    
    JRDropTitleItemView * titleView = self.subViews[_curIndex];
    NSString * titleStr;
    if (model.shouldShowOriginTitle) {
        JRCategory * category = self.jrOption.categoryArr[self.curIndex];
        titleStr = category.title.titleName;
    }else{
        titleStr = model.title;
    }
    [titleView setText:titleStr];
    
    [self.listTable reloadData];
    
    [self dismissWithAnimation:YES];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(jrDropMenuView:ResultArr:)]) {
        [self.delegate jrDropMenuView:self ResultArr:self.resultArr];
    }
}
#pragma mark - JRDropTitleItemViewDelegate
- (void)didClickTitleInJRDropTitleItemView:(JRDropTitleItemView *)itemView
{
    if (_curIndex != -1) {
        JRDropTitleItemView * lastView = self.subViews[_curIndex];
        lastView.isSelected = NO;
    }
    
    NSInteger curIndex = [self.subViews indexOfObject:itemView];
    
    if (curIndex == _curIndex) { //收回
        [self dismissWithAnimation:YES];
        return;
    }else{
        _curIndex = curIndex;
    }
    
    [self.itemsArr removeAllObjects];
    self.itemsArr = [NSMutableArray arrayWithArray:self.columnContentArr[_curIndex]];
    
    [self.listTable reloadData];
    
    [self show];
}
-(NSMutableArray *)subViews
{
    if (!_subViews) {
        _subViews = [NSMutableArray array];
    }
    return _subViews;
}
-(NSMutableArray *)itemsArr
{
    if (!_itemsArr) {
        _itemsArr = [NSMutableArray array];
    }
    return _itemsArr;
}
-(NSMutableArray *)columnContentArr
{
    if (!_columnContentArr) {
        _columnContentArr = [NSMutableArray array];
    }
    return _columnContentArr;
}
-(NSMutableArray<JRDropMenuItemModel *> *)resultArr
{
    if (!_resultArr) {
        _resultArr = [NSMutableArray array];
    }
    return _resultArr;
}
-(UITableView *)listTable
{
    if (!_listTable) {
    
        _listTable = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, CGRectGetMaxY(self.frame), self.frame.size.width, 0) style:UITableViewStylePlain];
        _listTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTable.dataSource = self;
        _listTable.delegate = self;
        _listTable.showsVerticalScrollIndicator = NO;
        NSBundle * bundle = [NSBundle bundleForClass:[JRDropMenuCell class]];
        [_listTable registerNib:[UINib nibWithNibName:NSStringFromClass([JRDropMenuCell class]) bundle:bundle]forCellReuseIdentifier: NSStringFromClass([JRDropMenuCell class])];
    }
    return _listTable;
}
-(UIView *)bottomIndicator
{
    if (!_bottomIndicator) {
        _bottomIndicator = [UIView new];
        _bottomIndicator.backgroundColor = self.jrOption.indicatorColor;
        _bottomIndicator.hidden = YES;
        _bottomIndicator.frame = CGRectMake(0, titleHeight - 2, titleWidth - 20, 1);
    }
    return _bottomIndicator;
}
-(UIView *)bottomSeparatLine
{
    if (!_bottomSeparatLine) {
        _bottomSeparatLine = [UIView new];
        _bottomSeparatLine.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
        _bottomSeparatLine.frame = CGRectMake(0, titleHeight - 1, self.frame.size.width, 1);
    }
    return _bottomSeparatLine;
}
-(UIView *)maskBgView
{
    if (!_maskBgView) {
        _maskBgView = [UIView new];
        _maskBgView.backgroundColor = self.jrOption.maskColor;
        _maskBgView.frame = CGRectMake(0, CGRectGetMaxY(self.frame), [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(self.frame));
        _maskBgView.hidden = YES;
        UITapGestureRecognizer * tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMask:)];
        [_maskBgView addGestureRecognizer:tapGR];
    }
    return _maskBgView;
}
- (void)tapMask:(UITapGestureRecognizer *)tapGR
{
    [self dismissWithAnimation:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
