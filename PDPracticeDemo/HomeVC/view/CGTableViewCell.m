//
//  CGTableViewCell.m
//  iOSTestProject
//
//  Created by 345 on 15/1/10.
//  Copyright (c) 2015年 345. All rights reserved.
//

#import "CGTableViewCell.h"

@interface CGTableViewCell ()

@end

@implementation CGTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)isVerificationModelTargetClass:(Class)targetClass forData:(id)model
{
    if (model && [model isKindOfClass:targetClass]) {
        return YES;
    }
    return NO;
}

- (void)setupCellContent:(id)dataModel
{
    
}
@end
