//
//  RecordingCircleOverlayView.m
//  PDPracticeDemo
//
//  Created by 345 on 15/5/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RecordingCircleOverlayView.h"

@implementation RecordingCircleOverlayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:self.center
                                                                  radius:100
                                                              startAngle:0
                                                                endAngle:2 * M_PI
                                                               clockwise:YES];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.path = [bezierPath CGPath];
        shapeLayer.lineWidth = 4;
        shapeLayer.lineJoin = kCALineJoinRound;
        shapeLayer.lineCap = kCALineCapRound;
        shapeLayer.strokeColor = [[UIColor darkGrayColor] CGColor];
        shapeLayer.fillColor = [[UIColor clearColor] CGColor];
        [self.layer addSublayer:shapeLayer];
    }
    return self;
}


@end
