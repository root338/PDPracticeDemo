//
//  UseGrandObject.h
//  PDPracticeDemo
//
//  Created by apple on 15/5/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG

#define NSLOG(format, ...) \
do  {   \
        fprintf(stderr, "<%s, %d> %s \n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__); \
        (NSLog)((format), ##__VA_ARGS__);   \
        fprintf(stderr, "-----------\n");   \
    } while(0)

#else

#define NSLOG(format, ...)

#endif

#define LOG(...) #__VA_ARGS__

#define TITLES(arr)  ([(arr) isKindOfClass:[NSArray class]] && [(arr) count]) ? () : nil

@interface UseGrandObject : NSObject

@end
