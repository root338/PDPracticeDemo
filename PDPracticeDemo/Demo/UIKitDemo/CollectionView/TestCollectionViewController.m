//
//  TestCollectionViewController.m
//  PDPracticeDemo
//
//  Created by 345 on 15/5/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TestCollectionViewController.h"
#import "UIView+Frame.h"

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
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(self.view.width - 20, 30);
    
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
    
    CGFloat red = arc4random() % 255 / 255.0;
    CGFloat green = arc4random() % 255 / 255.0;
    CGFloat blue = arc4random() % 255 / 255.0;
    cell.contentView.backgroundColor = [UIColor colorWithHue:red saturation:green brightness:blue alpha:1];
    
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
