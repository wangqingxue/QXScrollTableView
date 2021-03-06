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
#import "TableHeaderView.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic, weak) TableHeaderView *tableHeaderViewXib;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
        });
    }];
    
    self.navigationController.navigationBar.translucent = NO;
    [self initHeaderView];
}

- (void)initHeaderView{
    TableHeaderView *headerViewXib = [[[NSBundle mainBundle]loadNibNamed:@"TableHeaderView" owner:self options:nil]firstObject];
    [self.headerView addSubview:headerViewXib];
    self.tableHeaderViewXib = headerViewXib;
}


#pragma mark --TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableViewCell *baseCell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BaseTableViewCell class]) forIndexPath:indexPath];
    baseCell.controller = self;
    baseCell.baseTableView = self.tableView;
    baseCell.qxScrollView.contentOffset = self.tableViewContentOffset;
    baseCell.headerView = self.tableHeaderViewXib;
    [baseCell setValueWithArray:self.arrayData[indexPath.row]];
    return baseCell;
}

- (NSArray *)arrayData{
    if (!_arrayData){
        NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < 50; i++){
            NSMutableArray *rowArray = [NSMutableArray arrayWithCapacity:5];
            for (int y = 0; y < 5; y++){
                [rowArray addObject:[NSString stringWithFormat:@"第%i行 第%i列",i,y]];
            }
            [mutableArray addObject:rowArray];
        }
        _arrayData = [NSArray arrayWithArray:mutableArray];
    }
    return _arrayData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
