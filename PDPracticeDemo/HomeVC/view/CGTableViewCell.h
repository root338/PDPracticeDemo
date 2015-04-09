//
//  CGTableViewCell.h
//  iOSTestProject
//
//  Created by 345 on 15/1/10.
//  Copyright (c) 2015年 345. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 cell 的基类
 */
@interface CGTableViewCell : UITableViewCell

/**
 验证传入cell 中的数据类型是否正确
 
 @param targetClass 传入数据的目标类型
 @param model 传入的数据
 */
- (BOOL)isVerificationModelTargetClass:( Class)targetClass forData:(id)model;


/**
 设置cell 中的内容
 */
- (void)setupCellContent:(id)dataModel;
@end
