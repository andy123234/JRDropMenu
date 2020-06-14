//
//  FirstViewController.m
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/14.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "JRDropMenuView.h"

@interface FirstViewController ()

@property (nonatomic , copy) NSArray * arr;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.arr = @[@"标题有前缀",@"默认选中项",@"多列展示",@"自定义标题样式",@"自定义列表样式",@"设置选中不替换标题Index"];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //获取当前点击的cell的IndexPath
    NSIndexPath *indexPath = [_tableView indexPathForSelectedRow];
    
    SecondViewController * second = (SecondViewController *)segue.destinationViewController;
    second.menuType = indexPath.row;
    
}


@end
