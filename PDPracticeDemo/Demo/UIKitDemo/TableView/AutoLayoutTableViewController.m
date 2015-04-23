//
//  AutoLayoutTableViewController.m
//  PDPracticeDemo
//
//  Created by apple on 15/4/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AutoLayoutTableViewController.h"
#import "PureLayout.h"
#import "UILabel+CreateAutoLayout.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface AutoLayoutTableViewController ()

@property (strong, nonatomic) NSMutableDictionary *officeCellDic;

@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation AutoLayoutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.officeCellDic = [NSMutableDictionary new];
    self.tableView.estimatedRowHeight = 50;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[AutoLayoutTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    NSString *str = @"科学研究发现，四类脑电波对应大脑呈现的四种不同状态。\
    当您在紧张状态下，大脑产生的是β波；当您感到睡意朦胧时，脑电波就变成θ波；进入深睡时，变成δ波；当您的身体放松，大脑活跃，灵感不断的时候，就导出了α脑电波。\
    δ波：深度睡眠脑波状态（范围0.5-3HZ）\
    当人们的大脑频率处于δ波时，为深度睡眠、无意识状态。人的睡眠品质好坏与δ波有非常直接的关系。δ波睡眠是一种很深沉的睡眠状态，如果在辗转难眠时自己召唤出近似δ波状态，就能很快地摆脱失眠而进入深沉睡眠。\
    θ波：深度放松、无压力的潜意识状态（范围4-8HZ）\
    当人们的大脑频率处于θ波时，人的意识中断，身体深沉放松，对于外界的信息呈现高度的受暗示状态，即被催眠状态。θ波对于触发深沉记忆、强化长期记忆等帮助极大，所以θ波被称为\"通往记忆与学习的闸门\"。\
    α波：学习与思考的最佳脑波状态（范围8-13HZ）\
    当人们的大脑频率处于α波时，人的意识清醒，但身体却是放松的，它提供意识与潜意识的“桥梁”。在这种状态下，身心能量耗费最少，相对的脑部获得的能量较高，运作就会更加快速、顺畅、敏锐。α波被认为是人们学习与思考的最佳脑波状态。\
    β波：紧张、压力、脑疲劳时的脑波状态（范围14HZ以上）\
    人们清醒时，大部分时间大脑频率处于β波状态。随着β波的增加，身体逐渐呈紧张状态， 因而削减了体内免疫系统能力，此时人的能量消耗加剧，容易疲倦，若不充分休息，容易堆积压力（这是现代人的通病）。适当的β波对注意力提升以及认知行为的发展有积极作用。";
    self.dataSource = [NSMutableArray new];
    for (NSInteger i = 0; i < 10; i++) {
        NSInteger index = rand() % str.length;
        [self.dataSource addObject:[str substringToIndex:index]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *resueCell = cellIdentifier;
    AutoLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resueCell];
    
    // Configure the cell...
    cell.titleLabel.text = self.dataSource[indexPath.row]   ;
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *resueCell = cellIdentifier;
    
    AutoLayoutTableViewCell *cell = [self.officeCellDic objectForKey:resueCell];
    if (!cell) {
        cell = [[AutoLayoutTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resueCell];
        [self.officeCellDic setObject:cell forKey:resueCell];
    }
    
    cell.titleLabel.text = self.dataSource[indexPath.row];
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    cell.bounds = CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(cell.bounds));
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1;
    
    return height;
}

@end

@interface AutoLayoutTableViewCell ()
{
    BOOL didSetupConstraints;
}
@end

@implementation AutoLayoutTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //创建标签
        self.titleLabel = [UILabel createAutoLayoutLabel];
        self.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.titleLabel];
        
        self.separatorInset = UIEdgeInsetsZero;
    }
    return self;
}

- (void)updateConstraints
{
    if (!didSetupConstraints) {
        [self.titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 8, 8, 8)];
        didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    self.titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.titleLabel.bounds);
}
@end
