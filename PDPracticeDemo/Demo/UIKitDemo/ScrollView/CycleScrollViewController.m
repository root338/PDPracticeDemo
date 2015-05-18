//
//  CycleScrollViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/5/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CycleScrollViewController.h"
#import "CGCycleScrollView.h"

@interface CycleScrollViewController ()<CGCycleScrollViewDataSource>
{
    UIFont *commonFont;
    
    BOOL didSetupConstraints;
    
    CGCycleScrollView *_cycleView;
}
@end

@implementation CycleScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isFirstEnterHideNavigation = YES;
    
    commonFont = [UIFont systemFontOfSize:40];
    
    CGCycleScrollView *view = [[CGCycleScrollView alloc] init];
    view.dataSource = self;
    [self.view addSubview:view];
    
    _cycleView = view;
    
    [self updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewConstraints
{
    if (!didSetupConstraints) {
        
        [_cycleView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - CGCycleScrollViewDataSource
- (NSInteger)numberInCycleScrollView:(CGCycleScrollView *)cycleScrollView
{
    return 10;
}

- (UIView *)cycleScrollView:(CGCycleScrollView *)cycleScrollView viewForNumberAtIndex:(NSInteger)index
{
    UILabel *label = [[UILabel alloc] init];
    label.text = [@(index) stringValue];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = commonFont;
//    label.backgroundColor = [UIColor colorWithWhite:1.0/(1.1 + index) alpha:1];
    
    return label;
}
@end
