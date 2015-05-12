//
//  SubCustomViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SubCustomViewController.h"
#import "CGTitleTextField.h"
#import "CGTabScrollView.h"
#import "UIView+Frame.h"
#import "AreaEdge.h"

@interface SubCustomViewController ()<CGTabScrollViewDataSource>
{
    BOOL didSetupConstraints;
    UIScrollView *_scrollView;
    
    CGTitleTextField *_titleTextField;
    
    CGTabScrollView *_tabScrollView;
    
    NSArray *_dataSource;
}
@end

@implementation SubCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubview];
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

- (void)setupSubview
{
    _scrollView = [[UIScrollView alloc] initForAutoLayout];
    [self.view addSubview:_scrollView];
    
    _titleTextField = [[CGTitleTextField alloc] init];
    _titleTextField.viewSpace = 8;
    _titleTextField.edgeInsetView = UIEdgeInsetsMake(4, 4, 4, 4);
    _titleTextField.rightViewPriority = 251;
    
    _titleTextField.titleLabel.text = @"控件的标题";
    
    _titleTextField.inputTextField.placeholder = @"输入文本 CGTitleTextField类";
    _titleTextField.layer.borderColor = [UIColor brownColor].CGColor;
    _titleTextField.layer.borderWidth = 1;
    
    [_scrollView addSubview:_titleTextField];
    
    _dataSource = @[
                    @"标题",
                    @"控件",
                    @"好处",
                    @"完美的",
                    @"好处多多",
                    @"饮食而已",
                    @"随表",
                    @"逛逛",
                    @"随缘",
                    ];
    
    _tabScrollView = [[CGTabScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
//    _tabScrollView.itemWidth = 50;
    _tabScrollView.itemSpace = 8;
    [self.view addSubview:_tabScrollView];
    
    _tabScrollView.delegate = self;
}

- (void)updateViewConstraints
{
    if (!didSetupConstraints) {
        
        [_scrollView autoPinToTopLayoutGuideOfViewController:self withInset:0];
        [_scrollView autoPinToBottomLayoutGuideOfViewController:self withInset:0];
//        layoutConstraint.priority = 950;
        [_scrollView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
        [_scrollView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
        
        UIEdgeInsets edgeInsets = UIEdgeInsetsMake(8, 8, 0, 8);
        [_titleTextField autoPinEdgesToSuperviewEdgesWithInsets:edgeInsets excludingEdge:ALEdgeBottom];
        [_titleTextField autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0 relation:NSLayoutRelationGreaterThanOrEqual];
        
        [UIView autoSetPriority:900 forConstraints:^{
            //让有标题的输入视图将 scrollView的 contentsize 撑开，和scrollView的父视图一样宽
            [_titleTextField autoSetDimension:ALDimensionWidth toSize:self.view.bounds.size.width - edgeInsets.left - edgeInsets.right];
        }];
        
        [_tabScrollView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsEqualMake(20) excludingEdge:ALEdgeTop];
        [_tabScrollView autoSetDimension:ALDimensionHeight toSize:40];
        
        didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

#pragma mark - CGTabScrollViewDataSource
- (NSInteger)tabScrollViewNumberView:(CGTabScrollView *)tabScrollView
{
    return _dataSource.count;
}

- (CGFloat)tabScrollView:(CGTabScrollView *)tabScrollView widthForIndex:(NSInteger)index
{
    NSDictionary *dic = @{
                          NSFontAttributeName : [UIFont systemFontOfSize:15]
                          };
    NSString *title = _dataSource[index];
    CGSize fontSize = [title sizeWithAttributes:dic];
    
    return fontSize.width + 10;
}

- (UIView *)tabScrollView:(CGTabScrollView *)tabScrollView numberViewAtIndex:(NSInteger)index
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:_dataSource[index] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)handleButtonEvent:(id)sender
{
    [sender setSelected:YES];
}
@end
