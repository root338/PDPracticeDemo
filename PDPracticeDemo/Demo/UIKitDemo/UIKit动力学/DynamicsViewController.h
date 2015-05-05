//
//  DynamicsViewController.h
//  PDPracticeDemo
//
//  Created by 345 on 15/5/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BaseViewController.h"

/**
 使用2d物理引擎来实现
 */
@interface DynamicsViewController : BaseViewController<UICollisionBehaviorDelegate>

/**
 学习资源链接
    1. http://onevcat.com/2013/06/uikit-dynamics-started/
 */

//////////////////////////

@property (strong, nonatomic) UIDynamicAnimator *animator;


@end
