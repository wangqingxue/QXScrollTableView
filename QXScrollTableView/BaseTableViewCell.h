//
//  BaseTableViewCell.h
//  QXScrollTableView
//
//  Created by qingxue on 17/11/14.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "QXScrollView.h"
#import "TableHeaderView.h"

@interface BaseTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet QXScrollView *qxScrollView;
@property (nonatomic, weak)TableHeaderView *headerView;
@property (nonatomic, weak) UITableView *baseTableView;
@property (nonatomic, weak) ViewController *controller;
- (void)setValueWithArray:(NSArray *)array;

@end
