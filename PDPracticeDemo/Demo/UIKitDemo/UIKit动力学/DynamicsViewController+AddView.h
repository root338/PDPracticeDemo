//
//  DynamicsViewController+AddView.h
//  PDPracticeDemo
//
//  Created by 345 on 15/5/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DynamicsViewController.h"

@interface DynamicsViewController (AddView)

- (void)setupSubViews;

@end


//    //设置角度
//    aView.transform = CGAffineTransformRotate(aView.transform, 45);
//
//    //重力 Gravity
//
//    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
//    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[aView]];
//    [animator addBehavior:gravityBehavior];
//
//
//    //碰撞 Collision
//
//    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[aView]];
//
//    //设置碰撞边界
//    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
//
//    [animator addBehavior:collisionBehavior];
//    collisionBehavior.collisionDelegate = self;
//
//    self.animator = animator;
