//
//  VisualEffectViewController.m
//  PDPracticeDemo
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "VisualEffectViewController.h"

@interface VisualEffectViewController ()

@end

@implementation VisualEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CALayer *layer = [CALayer layer];
    
    ///当层内有多个层透明时，需设置组透明，这时叠加的层的透明度才一样
    layer.shouldRasterize = YES;
    ///需要设置 rasterizationScale 匹配屏幕
    layer.rasterizationScale = [UIScreen mainScreen].scale;
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
