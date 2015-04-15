//
//  BoardingMapViewController.m
//  PDPracticeDemo
//
//  Created by apple on 15/4/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BoardingMapViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+Frame.h"
#import "UIViewDefine.h"

@interface BoardingMapViewController ()
{
    CALayer *_imageLayer;
}

@end

@implementation BoardingMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageLayer = [CALayer layer];
    [self.view.layer addSublayer:_imageLayer];
}

- (void)resetImageLayerFrame
{
    [UIView animateWithDuration:.3 animations:^{
        if (__KDeviceIsLandscape) {
            _imageLayer.frame = self.view.bounds;
        }else {
            _imageLayer.frame = CGRectMake(0, 0, self.view.width, self.view.width * 3 / 4);
        }
    }];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
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
