//
//  CGRootViewController.m
//  iOSTestProject
//
//  Created by 345 on 15/1/10.
//  Copyright (c) 2015年 345. All rights reserved.
//

#import "CGRootViewController.h"
#import "CGTableViewDataSource.h"
#import "PureLayout.h"


@interface CGRootViewController ()
{
    CGTableViewDataSource *dataSourceDelegate;
}
@end

@implementation CGRootViewController

- (UITableView *)tableView
{
    if (_tableView) {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [_tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)initCommitData
{
    
}

- (void)setupTableView
{
    setupTableViewCellContent setCellBlock = ^(CGTableViewCell *cell, id model) {
        [cell setupCellContent:model];
    };
    dataSourceDelegate = [[CGTableViewDataSource alloc] initWithDataSource:self.dataSource identifierClass:_idenifierClass setupCellBlock:setCellBlock];
    self.tableView.dataSource = dataSourceDelegate;
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
