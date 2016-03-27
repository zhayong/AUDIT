//
//  LetfCell.m
//  AUDIT
//
//  Created by Zhayong on 11/23/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "HomePageLeftCell.h"
#import "HomePageLeftCellModel.h"

@interface HomePageLeftCell()
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *completCount;
@property (weak, nonatomic) IBOutlet UILabel *timeCost;

@end

@implementation HomePageLeftCell

+ (instancetype)HomePageLeftCellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"ID";
    HomePageLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        // 从XIB加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomePageLeftCell" owner:nil options:nil] lastObject];
        cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"history_cell_bg_normal"]];
        UIView *selectedBgView = [[UIView alloc]init];
        selectedBgView.frame = cell.frame;
        selectedBgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"history_cell_bg_selected"]];
        cell.selectedBackgroundView = selectedBgView;

    }
    return cell;

}
- (void)setHomePageLeftCellModel:(HomePageLeftCellModel *)homePageLeftCellModel
{
    _homePageLeftCellModel = homePageLeftCellModel;
    _dateLable.text = homePageLeftCellModel.draftStartTime;
    _name.text = homePageLeftCellModel.dealerName;
    if(homePageLeftCellModel.subjectCompleteCount == nil){
        homePageLeftCellModel.subjectCompleteCount = @"0";
    }
    if(homePageLeftCellModel.subjectTotalCount == nil){
        homePageLeftCellModel.subjectTotalCount = @"0";
    }
    _completCount.text = [NSString stringWithFormat:@"%@/%@",homePageLeftCellModel.subjectCompleteCount,homePageLeftCellModel.subjectTotalCount];
    if(homePageLeftCellModel.draftCostTime == nil){
        homePageLeftCellModel.draftCostTime = @"00:00:00";
    }
    _timeCost.text = homePageLeftCellModel.draftCostTime;
}
@end
