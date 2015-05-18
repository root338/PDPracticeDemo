//
//  HomeViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/4/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "TestObject.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    self.title = @"首 页";
    self.dataSource = [NSMutableArray arrayWithObjects:
                       [HomeCellModel createTitle:@"CoreAnimationDemo" string:@"CATableViewController" loadType:NO],
                       [HomeCellModel createTitle:@"UIKit Demo" string:@"UIKitDemoViewController" loadType:NO],
                       [HomeCellModel createVCTitle:@"Foundion的一些功能使用" className:@"FoundionDemoListViewController"],
                       nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [TestObject run];
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
