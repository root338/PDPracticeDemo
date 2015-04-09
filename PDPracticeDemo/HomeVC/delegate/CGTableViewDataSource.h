//
//  CGTableViewDelegate.h
//  iOSTestProject
//
//  Created by 345 on 15/1/10.
//  Copyright (c) 2015年 345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGTableViewCell.h"

typedef void(^setupTableViewCellContent)(CGTableViewCell *cell, id model);

/**
 tableView的数据源代理
 */
@interface CGTableViewDataSource : NSObject<UITableViewDataSource>

/**
 *  设置对象的必要数据
 *
 *  @param dataSource     添加的数据源
 *  @param identifier     cell 的标识符
 *  @param setupCellBlock 设置cell 的回调block
 *
 *  @return 返回初始化的对象
 */
- (instancetype)initWithDataSource:(NSArray *)dataSource identifierString:(NSString *)identifier setupCellBlock:(setupTableViewCellContent)setupCellBlock;

/**
 *  设置对象的必要数据
 *
 *  @param dataSource     添加的数据源
 *  @param identifier     cell 的标识符
 *  @param setupCellBlock 设置cell 的回调block
 *
 *  @return 返回初始化的对象
 */
- (instancetype)initWithDataSource:(NSArray *)dataSource identifierClass:(Class)identifier setupCellBlock:(setupTableViewCellContent)setupCellBlock;
@end
