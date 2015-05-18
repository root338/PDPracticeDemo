//
//  UseGrandObject.h
//  PDPracticeDemo
//
//  Created by apple on 15/5/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewCommonDefine.h"

#define LOG(...) #__VA_ARGS__

#define TITLES(arr)  ([(arr) isKindOfClass:[NSArray class]] && [(arr) count]) ? () : nil

@interface UseGrandObject : NSObject

@end
