//
//  ViewController.m
//  QXScrollTableView
//
//  Created by qingxue on 17/11/14.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import "ViewController.h"
#import "BaseTableViewCell.h"
#import <MJRefresh/MJRefresh.h>


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = nil;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
        });
    }];
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark --TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableViewCell *baseCell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BaseTableViewCell class]) forIndexPath:indexPath];
    baseCell.controller = self;
    baseCell.baseTableView = self.tableView;
    baseCell.qxScrollView.contentOffset = self.tableViewContentOffset;
    [baseCell setValueWithArray:self.arrayData];
    return baseCell;
}

- (NSArray *)arrayData{
    if (!_arrayData){
        _arrayData = @[@"行情1",@"行情1",@"行情1",@"行情1",@"行情1"];
    }
    return _arrayData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
