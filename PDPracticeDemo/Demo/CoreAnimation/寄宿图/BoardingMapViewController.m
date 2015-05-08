//
//  BoardingMapViewController.m
//  PDPracticeDemo
//
//  Created by apple on 15/4/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BoardingMapViewController.h"
@import QuartzCore;
#import "UIView+Frame.h"
#import "UIViewCommonDefine.h"

@interface BoardingMapViewController ()
{
    CALayer *_imageLayer;
}

@end

@implementation BoardingMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageLayer = [CALayer layer];
    _imageLayer.frame = CGRectMake(0, 64, 320, 320. * 3 / 4.);
    _imageLayer.backgroundColor = [UIColor darkGrayColor].CGColor;
    
    //层的 contents 属性
    //加载图片
    //只能加载CGImageRef
    UIImage *image = [UIImage imageNamed:@"car_001.jpg"];
    _imageLayer.contents = (__bridge id)image.CGImage;
    
    //层的 contentsGravity 属性
    //设置图片的加载方式
    //相当于UIImageView ContentMode
    _imageLayer.contentsGravity = kCAGravityCenter;
    
    
    //contentsScale属性定义了寄宿图的像素尺寸和视图大小的比例，默认情况下它是一个值为1.0的浮点数。
    //contentsScale属性其实属于支持高分辨率（又称Hi-DPI或Retina）屏幕机制的一部分
    //UIView有一个类似功能但是非常少用到的contentScaleFactor属性。
    //注意：设置contentsScale 时不能设置contentsGravity对图片有拉伸作用的值 （比如：kCAGravityResizeAspect）
//    _imageLayer.contentsScale = image.scale;
    _imageLayer.contentsScale = [UIScreen mainScreen].scale;
    
    //maskToBounds 属性
    //和UIView的 clipsToBounds属性相同
    //剪裁 超出层区域的内容
    _imageLayer.masksToBounds = YES;
    
    //contentsRect属性允许我们在图层边框里显示寄宿图的一个子域
//    _imageLayer.contentsRect = CGRectMake(0, 0, .5, .5);
    
    //contentsCenter 属性
    //
    //工作起来的效果和UIImage里的-resizableImageWithCapInsets: 方法效果非常类似
    _imageLayer.contentsCenter = CGRectMake(0.5, 0.5, .3, .3);
    
    [self.view.layer addSublayer:_imageLayer];
    
//    _imageLayer.delegate = self;
    
    //显示重绘视图
//    [_imageLayer display];
}

//当需要被重绘时，CALayer会请求它的代理给他一个寄宿图来显示
- (void)displayLayer:(CALayer *)layer
{
    
}

//代理想直接设置contents属性的话
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
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

@end
