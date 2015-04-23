//
//  AutoLayoutTableViewController.h
//  PDPracticeDemo
//
//  Created by apple on 15/4/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 使用auto layout计算cell高度
 */
@interface AutoLayoutTableViewController : UITableViewController

@end

@interface AutoLayoutTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *titleLabel;

@end