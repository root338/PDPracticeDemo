//
//  HomeTableViewCell.h
//  iOSTestProject
//
//  Created by 345 on 15/1/10.
//  Copyright (c) 2015年 345. All rights reserved.
//

#import "CGTableViewCell.h"

@interface HomeCellModel : NSObject

///显示列表中的名字
@property (strong, nonatomic) NSString *title;

///是否通过storyboard来加载视图控制器
@property (assign, nonatomic) BOOL isLoadingVCFromStoryboard;

///目标的类名
@property (assign, nonatomic) Class targetClass;

+ (HomeCellModel *)createTitle:(NSString *)title class:(Class)targetClass;
+ (HomeCellModel *)createTitle:(NSString *)title string:(NSString *)targetClassString;

+ (HomeCellModel *)createTitle:(NSString *)title class:(Class)targetClass loadType:(BOOL)isType;
+ (HomeCellModel *)createTitle:(NSString *)title string:(NSString *)targetClassString loadType:(BOOL)isType;
@end

@interface HomeTableViewCell : CGTableViewCell


@end
