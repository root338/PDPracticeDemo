//
//  BaseViewController.h
//  PDPracticeDemo
//
//  Created by apple on 15/4/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PureLayout.h"

@interface BaseViewController : UIViewController

/**
 *  移除点击屏幕显隐导航栏
 */
@property (assign, nonatomic) BOOL isRemoveTapHideNavgation;

/**
 第一次进入页面时隐藏导航栏
 */
@property (readwrite, nonatomic) BOOL isFirstEnterHideNavigation;
@end
