//
//  QXScrollView.m
//  QXScrollTableView
//
//  Created by qingxue on 17/11/14.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import "QXScrollView.h"

@implementation QXScrollView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.bounces = NO;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
