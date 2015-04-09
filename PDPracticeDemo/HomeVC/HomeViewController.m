//
//  ViewController.m
//  PDPracticeDemo
//
//  Created by apple on 15/4/9.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"

@interface HomeViewController ()<UITableViewDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"首 页";
    
    self.idenifierClass = [HomeTableViewCell class];
    self.dataSource = [NSMutableArray arrayWithObjects:
                       
                       
                       nil];
    [self setupTableView];
    
    self.tableView.delegate = self;
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
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
