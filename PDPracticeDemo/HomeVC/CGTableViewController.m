//
//  ViewController.m
//  PDPracticeDemo
//
//  Created by apple on 15/4/9.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CGTableViewController.h"

@interface CGTableViewController ()<UITableViewDelegate>

@end

@implementation CGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.idenifierClass = [HomeTableViewCell class];
    
    [self setupTableView];
    
    self.tableView.delegate = self;
    
    [self.tableView registerClass:self.idenifierClass forCellReuseIdentifier:NSStringFromClass(self.idenifierClass)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCellModel *model = self.dataSource[indexPath.row];
    if (!model.targetClass) {
        return;
    }
    
    UIViewController *vc = nil;
    
    if (model.isLoadingVCFromStoryboard) {
        vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(model.targetClass)];
    }else {
        vc = [model.targetClass new];
    }
    
    if (vc) {
        vc.title = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
