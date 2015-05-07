//
//  BaseViewController.m
//  PDPracticeDemo
//
//  Created by apple on 15/4/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    UITapGestureRecognizer *tap;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (!self.isRemoveTapHideNavgation) {
        [self tapToggle];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapToggle
{
    if (!tap) {
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapClickAction:)];
        [self.view addGestureRecognizer:tap];
    }else {
        [self.view removeGestureRecognizer:tap];
        tap = nil;
    }
}

- (void)handleTapClickAction:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:YES];
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
