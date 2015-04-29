//
//  Key-Value-ObservingUseViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/4/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "Key-Value-ObservingUseViewController.h"
#import "TestObject.h"

@interface Key_Value_ObservingUseViewController ()

@property (assign, nonatomic) BOOL isFistLoad;

@end

@implementation Key_Value_ObservingUseViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TestObject *obj = [[TestObject alloc] init];
    [obj addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    obj.age = 20;
    
    [obj removeObserver:self forKeyPath:@"age"];
    
    [self addObserver:self forKeyPath:@"isFistLoad" options:NSKeyValueObservingOptionNew context:nil];
    
    self.isFistLoad = YES;
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"age"]) {
        NSLog(@"key:%@,,%@", keyPath, change);
    }else if ([keyPath isEqualToString:@"isFistLoad"]) {
        NSLog(@"key :%@, %@", keyPath, change);
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"isFistLoad"];
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
