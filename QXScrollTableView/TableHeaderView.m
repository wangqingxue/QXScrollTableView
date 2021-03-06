//
//  TableHeaderView.m
//  QXScrollTableView
//
//  Created by 王庆学 on 2017/11/18.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import "TableHeaderView.h"
#import "QXScrollViewCell.h"

@interface TableHeaderView()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;




@end

@implementation TableHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.scrollView.contentSize = CGSizeMake(500, 0);
    QXScrollViewCell * qxScrollCell = [[[NSBundle mainBundle]loadNibNamed:@"QXScrollViewCell" owner:self options:nil]firstObject];
    [qxScrollCell setValueWithArray:@[@"标题1",@"标题2",@"标题3",@"标题4",@"标题5"]];
    qxScrollCell.frame = CGRectMake(0, 0, 500, 50);
    [self.scrollView addSubview:qxScrollCell];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
