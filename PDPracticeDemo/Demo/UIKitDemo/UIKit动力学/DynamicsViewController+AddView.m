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
    self.subTestKitDynamic = aView;
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //重力
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[aView]];
    [self.animator addBehavior:gravity];
    
    //碰撞
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[aView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureRecognizer:)];
    [self.view addGestureRecognizer:pan];
}

- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        CGPoint anchor = CGPointMake(self.subTestKitDynamic.center.x, self.subTestKitDynamic.center.y);
        UIOffset offset = UIOffsetMake(-25, -25);
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.subTestKitDynamic offsetFromCenter:offset attachedToAnchor:anchor];
        [self.animator addBehavior:attachment];
        self.attachment = attachment;
    }else if (gesture.state == UIGestureRecognizerStateChanged) {
        
        [self.attachment setAnchorPoint:[gesture locationInView:self.view]];
    }else if (gesture.state == UIGestureRecognizerStateEnded) {
        
        [self.animator removeBehavior:self.attachment];
    }
}
@end
