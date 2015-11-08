//
//  ViewController.m
//  TwoWayScrollView
//
//  Created by 张昊煜 on 15/11/4.
//  Copyright © 2015年 ZhYu. All rights reserved.
//

#import "ViewController.h"
#import "ZYTableViewCell.h"

@interface ViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, ZYTableViewCellDelegate>
//数据
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) UIScrollView *scrollView;
//每个的视图
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDate];
    
    [self setupUI];
}

- (void)setupDate
{
    UIView *v = [[UIView alloc] init];
    [self.array addObject:v];
    [self.array addObject:v];
    [self.array addObject:v];
    [self.array addObject:v];
}

- (void)setupUI
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*self.array.count, self.view.frame.size.height);
    //弹动的效果
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i=0; i<self.array.count; i++) {
        
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        table.delegate = self;
        table.dataSource = self;
        table.frame = CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, self.view.frame.size.height);
        [table registerClass:[ZYTableViewCell class] forCellReuseIdentifier:[ZYTableViewCell cellReuseIdentifier]];
        [self.scrollView addSubview:table];
    }
    
    [self.view addSubview:self.scrollView];
    
}

#pragma mark - UIScrollViewDelegate
//跑马灯
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"scrollViewDidScroll");
    CGPoint point=scrollView.contentOffset;
//    NSLog(@"%f,%f",point.x,point.y);
//    NSLog(@"%f %f",point.x, self.view.frame.size.width*(self.array.count-1));
    if (point.x == self.view.frame.size.width*(self.array.count-1)) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }
}

#pragma mark - ZYTableViewCellDelegate

- (void)ZYTableViewCell:(ZYTableViewCell *)ZYTableViewCell
{
    NSLog(@"11111");
}

#pragma mark - UITableViewDelegate&UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        ZYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ZYTableViewCell cellReuseIdentifier]];
        cell.delegate = self;
        cell.contentView.backgroundColor = [UIColor redColor];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    }
    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark - getters

- (NSArray *)array
{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }
    return _scrollView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}

@end
