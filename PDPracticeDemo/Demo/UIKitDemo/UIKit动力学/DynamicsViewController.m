//
//  DynamicsViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/5/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DynamicsViewController.h"
#import "DynamicsViewController+AddView.h"

@interface DynamicsViewController ()

@end

@implementation DynamicsViewController

- (void)viewDidLoad {
    
    self.isRemoveTapHideNavgation = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubViews];
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
