//
//  FirstViewController.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/14.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

NS_ASSUME_NONNULL_END
