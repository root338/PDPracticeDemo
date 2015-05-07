//
//  UIKitDemoViewController.m
//  PDPracticeDemo
//
//  Created by apple on 15/4/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIKitDemoViewController.h"
#import "UIView+Frame.h"


@interface UIKitDemoViewController ()

@end

@implementation UIKitDemoViewController

- (void)viewDidLoad {
    
    self.dataSource = [NSMutableArray arrayWithArray:@[
                                                       [HomeCellModel createTitle:@"使用auto layout计算cell" string:@"AutoLayoutTableViewController" loadType:NO],
                                                       [HomeCellModel createTitle:@"自定义Label的使用示例" string:@"LabelViewController" loadType:NO],
                                                       [HomeCellModel createTitle:@"自定义View的使用示例" string:@"SubCustomViewController" loadType:NO],
                                                       [HomeCellModel createVCTitle:@"UIKit Dynamic" className:@"DynamicsViewController"]
                                                       ]];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view x];
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
