//
//  VisualEffectViewController.m
//  PDPracticeDemo
//
//  Created by apple on 15/4/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "VisualEffectViewController.h"

@interface VisualEffectViewController ()

@end

@implementation VisualEffectViewController
{
    NSMutableArray *test;
    
    CALayer *_mask;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    CALayer *layer = [CALayer layer];
//    
//    ///当层内有多个层透明时，需设置组透明，这时叠加的层的透明度才一样
//    layer.shouldRasterize = YES;
//    ///需要设置 rasterizationScale 匹配屏幕
//    layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    UIImage *image = [UIImage imageNamed:@"五角星.png"];
    CALayer *layout = [CALayer layer];
    layout.frame = self.view.bounds;
    layout.contentsGravity = kCAGravityResizeAspect;
    
    layout.contents = (__bridge id)(image.CGImage);
    [self.view.layer addSublayer:layout];
    
    CALayer *mask = [CALayer layer];
    CGRect frame = layout.frame;
    frame.size.width /= 2;
    mask.frame = frame;
    mask.backgroundColor = [UIColor redColor].CGColor;
    layout.mask = mask;
    _mask = mask;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self changeMaskFrame:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    [self changeMaskFrame:touches];
}

- (void)changeMaskFrame:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    CGRect frame = _mask.frame;
    frame.size.width = point.x;
    _mask.frame = frame;
}
@end
