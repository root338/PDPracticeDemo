//
//  CGTableViewDelegate.m
//  iOSTestProject
//
//  Created by 345 on 15/1/10.
//  Copyright (c) 2015年 345. All rights reserved.
//

#import "CGTableViewDataSource.h"

@interface CGTableViewDataSource ()

/**
 cell 的唯一标识符
 */
@property (strong, nonatomic) NSString *idenifier;

/**
 加载的数据
 */
@property (weak, nonatomic) NSArray *dataSource;

@property (copy, nonatomic) setupTableViewCellContent setupCellBlock;
@end

@implementation CGTableViewDataSource

- (instancetype)initWithDataSource:(NSArray *)dataSource identifierClass:(__unsafe_unretained Class)identifier setupCellBlock:(setupTableViewCellContent)setupCellBlock
{
    return [self initWithDataSource:dataSource identifierString:NSStringFromClass(identifier) setupCellBlock:setupCellBlock];
}

- (instancetype)initWithDataSource:(NSArray *)dataSource identifierString:(NSString *)identifier setupCellBlock:(setupTableViewCellContent)setupCellBlock
{
    self = [super init];
    if (self) {
        self.idenifier = identifier;
        self.dataSource = dataSource;
        self.setupCellBlock = setupCellBlock;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_idenifier];
    
    if (cell) {
        if (_setupCellBlock && indexPath.row < _dataSource.count) {
            _setupCellBlock((id)cell, _dataSource[indexPath.row]);
        }
    }else {
        NSAssert(cell, @"cell 不能为空");
    }
    return cell;
}

@end
