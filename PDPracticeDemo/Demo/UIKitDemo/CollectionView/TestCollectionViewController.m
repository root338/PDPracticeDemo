//
//  TestCollectionViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/5/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TestCollectionViewController.h"
#import "UIView+Frame.h"
#import "AreaEdge.h"
#import "UIViewCommonDefine.h"
#import "CGSpringCollectionViewFlowLayout.h"

NSString * const cellIdentifion = @"cellIdentifion";

@interface TestCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}
@end

@implementation TestCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGSpringCollectionViewFlowLayout *flowLayout = [[CGSpringCollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(self.view.width - 20, 30);
    flowLayout.sectionInset = UIEdgeInsetsEqualMake(8);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleEdgeMargin;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifion];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 60;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellResue = cellIdentifion;
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellResue forIndexPath:indexPath];
    
    CGFloat red = arc4random() % 255;
    CGFloat green = arc4random() % 255;
    CGFloat blue = arc4random() % 255;
    cell.contentView.backgroundColor = __KRGB(red, green, blue);
    
    return cell;
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
