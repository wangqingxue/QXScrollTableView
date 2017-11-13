//
//  QXScrollViewCell.m
//  QXScrollTableView
//
//  Created by qingxue on 17/11/14.
//  Copyright © 2017年 qingxue. All rights reserved.
//

#import "QXScrollViewCell.h"

@interface QXScrollViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *labelO;
@property (weak, nonatomic) IBOutlet UILabel *labelT;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;

@end

@implementation QXScrollViewCell

- (void)setValueWithArray:(NSArray *)array{
    if ([array count] == 5){
        _labelO.text = array[0];
        _labelT.text = array[0];
        _labelThree.text = array[0];
        _labelFour.text = array[0];
        _labelFive.text = array[0];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
