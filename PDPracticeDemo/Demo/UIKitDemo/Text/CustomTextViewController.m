//
//  CustomTextViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/5/4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CustomTextViewController.h"
//#import "CGPlaceholderTextView.h"
#import "PureLayout.h"
#import "UIButton+GCLayout.h"
#import "RecordingCircleOverlayView.h"

@interface CustomTextViewController ()<UITextViewDelegate>
{
    UITextView *_placeholderTextView;
    
    BOOL isDidSetupConstraints;
}
@end

@implementation CustomTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.
    _placeholderTextView = [[UITextView alloc] init];
//    _placeholderTextView.placeholder = @"提示文本";
    _placeholderTextView.text = @"输入文本框的内容";
    _placeholderTextView.delegate = self;
    _placeholderTextView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_placeholderTextView];
    [self updateViewConstraints];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"button title" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"pengyouquan"] forState:UIControlStateNormal];
    [button sizeToFit];
    button.center = self.view.center;
    [button setTitle:@"button title button title" forState:UIControlStateNormal];
    [button centerImageAndButton:10 imageOnTop:YES];
    [self.view addSubview:button];
    
    [self.view addSubview:[[RecordingCircleOverlayView alloc] initWithFrame:self.view.bounds]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewConstraints
{
    if (!isDidSetupConstraints) {
        
        [_placeholderTextView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
        [_placeholderTextView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
        [_placeholderTextView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
        [_placeholderTextView autoSetDimension:ALDimensionHeight toSize:40];
        
        isDidSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return YES;
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
