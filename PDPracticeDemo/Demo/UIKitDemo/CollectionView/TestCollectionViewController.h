//
//  TestCollectionViewController.h
//  PDPracticeDemo
//
//  Created by 345 on 15/5/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BaseViewController.h"

@interface TestCollectionViewController : BaseViewController

@end

/**
 UICollectionViewCell:
    这次Apple给我们带来的好康是被选中cell的自动变化，所有的cell中的子view，也包括contentView中的子view，在当cell被选中时，会自动去查找view是否有被选中状态下的改变。比如在contentView里加了一个normal和selected指定了不同图片的imageView，那么选中这个cell的同时这张图片也会从normal变成selected，而不需要额外的任何代码。
 */