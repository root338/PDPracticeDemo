//
//  LabelViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "LabelViewController.h"
#import "CreateView.h"
#import "PureLayout.h"
#import "CGPlaceholderLabel.h"

@interface LabelViewController ()<UITextFieldDelegate>
{
    ///标识约束是否设置成功
    BOOL didSetupConstraints;
    
    UITextField *_textField;
    CGPlaceholderLabel *_placeholderLabel;
}
@end

@implementation LabelViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubView];
    
    [self updateViewConstraints];
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

- (void)setupSubView
{
    _textField = (UITextField *)[self.view createSubAutoLayoutClass:[UITextField class]];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.delegate = self;
    
    _placeholderLabel = [[CGPlaceholderLabel alloc] init];
    _placeholderLabel.placeholderText = @"提示文字 CGPlaceholderLabel类的使用";
    _placeholderLabel.attributedDictionary = @{
                                               NSFontAttributeName : [UIFont systemFontOfSize:12],
                                               NSForegroundColorAttributeName : [UIColor lightGrayColor]
                                               };
    _placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_placeholderLabel];
}

- (void)updateViewConstraints
{
    if (!didSetupConstraints) {
        
//        [_textField autoAlignAxisToSuperviewAxis:alaxi];
        [_textField autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
        [_textField autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
        [_textField autoSetDimension:ALDimensionHeight toSize:40];
        
        [_placeholderLabel autoPinToTopLayoutGuideOfViewController:self withInset:20];
        [_placeholderLabel autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_textField];
        [_placeholderLabel autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_textField];
        [_placeholderLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_textField withOffset:-8];
        
        
        didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    _placeholderLabel.text = str;
    
    return YES;
}
@end
