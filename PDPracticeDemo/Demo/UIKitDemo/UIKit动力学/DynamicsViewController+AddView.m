//
//  DynamicsViewController+AddView.m
//  PDPracticeDemo
//
//  Created by 345 on 15/5/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DynamicsViewController+AddView.h"

@implementation DynamicsViewController (AddView)

- (void)setupSubViews
{
    [self demoView1];
}

- (void)demoView1
{
    //动态  Dynamic
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    aView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:aView];
    
    //设置角度
    aView.transform = CGAffineTransformRotate(aView.transform, 45);
    
    //重力 Gravity
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[aView]];
    [animator addBehavior:gravityBehavior];
    
    
    //碰撞 Collision
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[aView]];
    
    //设置碰撞边界
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [animator addBehavior:collisionBehavior];
    collisionBehavior.collisionDelegate = self;
    
    
    
    
    self.animator = animator;
}

@end
