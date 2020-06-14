//
//  ViewController.m
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/1.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#import "ViewController.h"
#import "JRDropMenuView.h"

@interface ViewController ()<JRDropMenuDelegate>

@property (nonatomic , strong) JRDropMenuView * menuView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.menuView = [[JRDropMenuView alloc] initWithFrame:CGRectMake(20, 80, [UIScreen mainScreen].bounds.size.width - 40, 44)];
    self.menuView.delegate = self;
    [self.menuView createJRDropMenuViewWithOption:[self setupOption]];
    [self.view addSubview:self.menuView];
}
- (JROption *)setupOption
{
    JROption * option = JROption.new
    .categoryArrSet(@[
                        JRCategory.new
                        .titleSet(JRTitle.new
                                  .titleNameSet(@"Vsl")
                                  .titleSelectedTintColorSet([UIColor colorWithRed:64/255.0 green:158/255.0 blue:255/255.0 alpha:1])
                                  .titleNormalTintColorSet([UIColor colorWithRed:82/255.0 green:102/255.0 blue:118/255.0 alpha:1])
                                  .titleNormalFontSet([UIFont systemFontOfSize:11])
                                  .defaultIndexSet(1)
                                  )
                        .listSet(JRList.new
                                 .listArrSet(@[@"ALL",@"Ocean Dalian"])
                                 .showOriginTitleIndexArrSet(@[@0])
                                 .listRowHeightSet(40)
                                 )
                        ,

                        JRCategory.new
                        .titleSet(JRTitle.new
                                  .titleNameSet(@"Type")
                                  )
                        .listSet(JRList.new
                                 .listArrSet(@[@"ALL",@"Noon",@"EOSP",@"Berthing",@"Anchoring",@"Shifting",@"Cargo",@"Departure"])
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
                    )
    .showIndicatorSet(YES)
    .showBottomLineSet(YES);
    return option;
    
//    JROption * option = JROption.new
//       .categoryArrSet(@[
//                           JRCategory.new
//                           .titleSet(JRTitle.new
//                                     .titleNameSet(@"Vsl")
//                                     .titleSelectedTintColorSet([UIColor blackColor])
//                                     .titleNormalTintColorSet([UIColor whiteColor])
//                                     .titleNormalFontSet([UIFont systemFontOfSize:12])
//                                     .titleNormalBgColorSet([UIColor colorWithRed:6/255.0 green:26/255.0 blue:52/255.0 alpha:.8])
//                                     .preTitleStrSet(@"Voyage : ")
//                                     )
//                           .listSet(JRList.new
//                                    .listArrSet(@[@"ALL",@"Ocean Dalian"])
//                                    .listRowHeightSet(40)
//                                    .listNormalBgColorSet([UIColor whiteColor])
//                                    .listNormalTintColorSet([UIColor lightGrayColor])
//                                    )
//                         ]
//                       )
//       .showIndicatorSet(NO)
//       .showBottomLineSet(NO)
//       .maskColorSet([UIColor clearColor])
//       .cornerRadiusSet(4);
//       return option;
}
#pragma mark - Delegate
-(void)jrDropMenuView:(JRDropMenuView *)jrDropMenuView ResultArr:(nonnull NSMutableArray<JRDropMenuItemModel *> *)resultArr
{
    
}

@end
