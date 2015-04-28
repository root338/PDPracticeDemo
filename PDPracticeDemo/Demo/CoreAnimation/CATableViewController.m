//
//  CATableViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/4/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CATableViewController.h"

@interface CATableViewController ()

@end

@implementation CATableViewController

- (void)viewDidLoad {
    
    self.dataSource = [NSMutableArray arrayWithObjects:
                       [HomeCellModel createVCTitle:@"寄宿图" className:@"BoardingMapViewController"],
                       [HomeCellModel createVCTitle:@"视觉效果" className:@"VisualEffectViewController"],
                       nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
