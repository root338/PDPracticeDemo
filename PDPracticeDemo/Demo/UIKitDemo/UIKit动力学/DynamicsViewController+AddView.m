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
    [self demoView2];
}

- (void)demoView1
{
    //动态  Dynamic
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    aView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:aView];
    self.subTestDynamicView = aView;
    
    //设置角度
//    aView.transform = CGAffineTransformRotate(aView.transform, 45);
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //碰撞 Collision
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[aView]];
    
    //设置碰撞边界
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [animator addBehavior:collisionBehavior];
    collisionBehavior.collisionDelegate = self;
    
    
    //重力 Gravity
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[aView]];
    [animator addBehavior:gravityBehavior];
    
    self.animator = animator;
}

- (void)demoView2
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureReognizer:)];
    [self.view addGestureRecognizer:pan];
}

- (void)handlePanGestureReognizer:(UIPanGestureRecognizer *)paramPan
{
    if (paramPan.state == UIGestureRecognizerStateBegan) {
        
        CGPoint attachedToanchror = CGPointMake(self.subTestDynamicView.center.x, self.subTestDynamicView.center.y - 100);
//        CGPoint offsetFromCenter = CGPointMake(-25, -25);
        UIOffset offset = UIOffsetMake(-25, -25);
        
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.subTestDynamicView offsetFromCenter:offset attachedToAnchor:attachedToanchror];
        self.attachmentBehavior = attachment;
        [self.animator addBehavior:attachment];
    }else if (paramPan.state == UIGestureRecognizerStateChanged) {
        
        [self.attachmentBehavior setAnchorPoint:[paramPan locationInView:self.view]];
    }else if (paramPan.state == UIGestureRecognizerStateEnded) {
        
        [self.animator removeBehavior:self.attachmentBehavior];
    }
}

@end
