//
//  LetfCell.m
//  AUDIT
//
//  Created by Zhayong on 11/23/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "LeftCell.h"
#import "LeftCellModel.h"

@interface LeftCell()
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *completCount;
@property (weak, nonatomic) IBOutlet UILabel *timeCost;
@end

@implementation LeftCell

+ (instancetype)leftCellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"ID";
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        // 从XIB加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LeftCell" owner:nil options:nil] lastObject];
    }
    return cell;

}

- (void)setLeftCellMode:(LeftCellModel *)leftCellMode
{
    _leftCellMode = leftCellMode;
    _dateLable.text = leftCellMode.subjectStartTime;
    _name.text = leftCellMode.dealerName;
    _completCount.text = [NSString stringWithFormat:@"%@/%@",leftCellMode.subjectCompleteCount,leftCellMode.subjectTotalCount];
    _timeCost.text = leftCellMode.sujectCostTime;
}

@end
