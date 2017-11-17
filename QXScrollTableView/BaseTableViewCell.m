//
//  BaseTableViewCell.m
//  QXScrollTableView
//
//  Created by qingxue on 17/11/14.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "QXScrollViewCell.h"

@interface BaseTableViewCell ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (nonatomic, strong) QXScrollViewCell *qxScrollCell;

@end

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.qxScrollView.contentSize = CGSizeMake(500, 0);
    self.qxScrollCell = [[[NSBundle mainBundle]loadNibNamed:@"QXScrollViewCell" owner:self options:nil]firstObject];
    self.qxScrollCell.frame = CGRectMake(0, 0, 500, 50);
    [self.qxScrollView addSubview:self.qxScrollCell];
    self.qxScrollView.delegate = self;
}

- (void)setValueWithArray:(NSArray *)array{
    [self.qxScrollCell setValueWithArray:array];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    for (BaseTableViewCell *cell in self.baseTableView.visibleCells){
        cell.qxScrollView.contentOffset = scrollView.contentOffset;
        self.controller.tableViewContentOffset = scrollView.contentOffset;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
