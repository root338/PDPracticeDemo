//
//  HomeTableViewCell.m
//  iOSTestProject
//
//  Created by 345 on 15/1/10.
//  Copyright (c) 2015年 345. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeCellModel

+ (HomeCellModel *)createTitle:(NSString *)title class:(Class)targetClass
{
    return [self createTitle:title class:targetClass loadType:YES];
}

+ (HomeCellModel *)createTitle:(NSString *)title string:(NSString *)targetClassString
{
    return [self createTitle:title class:NSClassFromString(targetClassString)];
}

+ (HomeCellModel *)createTitle:(NSString *)title string:(NSString *)targetClassString loadType:(BOOL)isType
{
    return [self createTitle:title class:NSClassFromString(targetClassString) loadType:isType];
}

+ (HomeCellModel *)createVCTitle:(NSString *)title className:(NSString *)className
{
    return [self createTitle:title string:className loadType:NO];
}

+ (HomeCellModel *)createTitle:(NSString *)title class:(Class)targetClass loadType:(BOOL)isType
{
    HomeCellModel *model = [[HomeCellModel alloc] init];
    model.title = title;
    model.targetClass = targetClass;
    model.isLoadingVCFromStoryboard = isType;
    return model;
}
@end

@interface HomeTableViewCell ()
{
    
}
@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupCellContent:(HomeCellModel *)dataModel
{
    self.textLabel.text = dataModel.title;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}
@end
