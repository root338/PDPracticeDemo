//
//  CGRootViewController.h
//  iOSTestProject
//
//  Created by 345 on 15/1/10.
//  Copyright (c) 2015年 345. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 视图控制器的基类
 
 用于显示列表
 */
@interface CGRootViewController : UIViewController

/**
 显示的列表
 */
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/**
 加载的数据
 */
@property (strong, nonatomic) NSMutableArray *dataSource;

/**
 设置cell 的唯一标识类
 */
@property (assign, nonatomic) Class idenifierClass;

/**
 设置表格了方法
 */
- (void)setupTableView;

/**
 初始化一些数据
 */
- (void)initCommitData;
@end
