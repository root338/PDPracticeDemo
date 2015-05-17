//
//  FoundionDemoListViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/4/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "FoundionDemoListViewController.h"
#import "UseGrandObject.h"

@interface FoundionDemoListViewController ()

@end

@implementation FoundionDemoListViewController

- (void)viewDidLoad {
    
    self.dataSource = [NSMutableArray arrayWithArray:@[
                                                       [HomeCellModel createVCTitle:@"KVC的使用" className:@"Key_Value_ObservingUseViewController"],
                                                       ]];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UseGrandObject new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
