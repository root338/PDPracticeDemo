//
//  TestObject.m
//  PDPracticeDemo
//
//  Created by 345 on 15/4/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TestObject.h"

@interface TestObject ()

@property (strong, nonatomic) NSString *testKVOStr;
@end

@implementation TestObject

+ (void)run
{
    TestObject *obj;
    if (obj == nil) {
        obj = [TestObject new];
    }
    [obj run];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:@"testKVOStr" options:NSKeyValueObservingOptionNew context:nil];
        
        NSLog(@"%s", __func__);
        
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"testKVOStr"]) {
        NSLog(@"KVO 通知 %@",change[NSKeyValueChangeNewKey]);
    }
}

- (void)run
{
    //
//    NSURL *baseURL = [NSURL URLWithString:@"http://www.baidu.com/"];
//    
//    NSURL *newUrl = [NSURL URLWithString:@"/p" relativeToURL:baseURL];
//    NSLog(@"%@", newUrl);
    
//    self.testKVOStr = @"点语句赋值";
//
//    [self setTestKVOStr:@"使用 set 方法赋值"];
//
//    [self setValue:@"go" forKey:@"testKVOStr"];
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"testKVOStr"];
}
@end
