//
//  SecondViewController.m
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/14.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic , strong) JRDropMenuView * menuView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.menuView = [[JRDropMenuView alloc] initWithFrame:CGRectMake(00, 88, [UIScreen mainScreen].bounds.size.width, 44)];
    self.menuView.delegate = self;
    
    [self.view addSubview:self.menuView];
    
    [self setupMenuWithJRDromMenuType:self.menuType];
}
- (void)setupMenuWithJRDromMenuType:(JRDropMenuType)type
{
    switch (type) {
        case JRDropMenuTypePre://有前缀
            [self.menuView createJRDropMenuViewWithOption:[self option1]];
            break;
        case JRDropMenuTypeDefault://有默认选中项
            [self.menuView createJRDropMenuViewWithOption:[self option2]];
        break;
        case JRDropMenuTypeMultiple://多列
            [self.menuView createJRDropMenuViewWithOption:[self option3]];
        break;
        case JRDropMenuTypeTitleCustom://自定义标题样式
            [self.menuView createJRDropMenuViewWithOption:[self option4]];
        break;
        case JRDropMenuTypeListCustom://自定义列表样式
            [self.menuView createJRDropMenuViewWithOption:[self option5]];
        break;
        case JRDropMenuTypeListShowOrigin://设置选中不替换标题Index
            [self.menuView createJRDropMenuViewWithOption:[self option6]];
        break;
            
        default:
            break;
    }
    
}
- (JROption *)option1
{
    JROption * option = JROption.new
   .categoryArrSet(@[
                       JRCategory.new
                       .titleSet(JRTitle.new
                                 .titleNameSet(@"Lan")
                                 .preTitleStrSet(@"Language : ")
                                 )
                       .listSet(JRList.new
                                .listArrSet(@[@"ALL",@"PHP",@"OC",@"Swift",@"Java",@"JavaScript"])
                                )
                     ]
                   );
   return option;
}
- (JROption *)option2
{
    JROption * option = JROption.new
   .categoryArrSet(@[
                       JRCategory.new
                       .titleSet(JRTitle.new
                                 .titleNameSet(@"Lan")
                                 .preTitleStrSet(@"Language : ")
                                 .defaultIndexSet(2)
                                 )
                       .listSet(JRList.new
                                .listArrSet(@[@"ALL",@"PHP",@"OC",@"Swift",@"Java",@"JavaScript"])
                                )
                     ]
                   );
   return option;
}
- (JROption *)option3
{
    JROption * option = JROption.new
    .categoryArrSet(@[
                        JRCategory.new
                        .titleSet(JRTitle.new
                                  .titleNameSet(@"Language")
                                  )
                        .listSet(JRList.new
                                 .listArrSet(@[@"ALL",@"PHP",@"OC",@"Swift",@"Java",@"JavaScript"])
                                 )
                        ,

                        JRCategory.new
                        .titleSet(JRTitle.new
                                  .titleNameSet(@"Month")
                                  )
                        .listSet(JRList.new
                                 .listArrSet(@[@"ALL",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"])
                                 .listRowHeightSet(40)
                                 )
                        ,

                        JRCategory.new
                        .titleSet(JRTitle.new
                                  .titleNameSet(@"Time")
                                  )
                        .listSet(JRList.new
                                 .listArrSet(@[@"ALL",@"Last 24h",@"Last 7day",@"Last 30day"])
                                 .listRowHeightSet(40)
                                 )
                      ]
                    );
    return option;
}
- (JROption *)option4
{
    JROption * option = JROption.new
    .categoryArrSet(@[
                        JRCategory.new
                        .titleSet(JRTitle.new
                                  .titleNameSet(@"Language")
                                  .titleSelectedTintColorSet([UIColor blackColor])
                                  .titleNormalTintColorSet([UIColor whiteColor])
                                  .titleNormalFontSet([UIFont systemFontOfSize:12])
                                  .titleNormalBgColorSet([UIColor colorWithRed:6/255.0 green:26/255.0 blue:52/255.0 alpha:.8])
                                  )
                        .listSet(JRList.new
                                 .listArrSet(@[@"ALL",@"PHP",@"OC",@"Swift",@"Java",@"JavaScript"])
                                 
                                 )
                      ]
                    )
    .showIndicatorSet(NO);
    return option;
}
- (JROption *)option5
{
    JROption * option = JROption.new
    .categoryArrSet(@[
                        JRCategory.new
                        .titleSet(JRTitle.new
                                  .titleNameSet(@"Language")
                                  .changeTitleStyleSet(ChangeTitleStyleNever)
                                  )
                        .listSet(JRList.new
                                 .listArrSet(@[@"ALL",@"PHP",@"OC",@"Swift",@"Java",@"JavaScript"])
                                 .listRowHeightSet(60)
                                 .listNormalBgColorSet([UIColor lightGrayColor])
                                 .listNormalTintColorSet([UIColor redColor])
                                 )
                      ]
                    )
    .showIndicatorSet(NO);
    return option;
}
- (JROption *)option6
{
    JROption * option = JROption.new
    .categoryArrSet(@[
                        JRCategory.new
                        .titleSet(JRTitle.new
                                  .titleNameSet(@"Language")
                                  .changeTitleStyleSet(ChangeTitleStyleCustom)
                                  )
                        .listSet(JRList.new
                                 .listArrSet(@[@"ALL(选中不替换标题)",@"PHP",@"OC(选中不替换标题)",@"Swift",@"Java",@"JavaScript"])
                                 .listRowHeightSet(60)
                                 .listNormalBgColorSet([UIColor lightGrayColor])
                                 .listNormalTintColorSet([UIColor redColor])
                                 .showOriginTitleIndexArrSet(@[@0,@2])
                                 )
                      ]
                    )
    .showIndicatorSet(NO);
    return option;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.menuView dismissWithAnimation:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
