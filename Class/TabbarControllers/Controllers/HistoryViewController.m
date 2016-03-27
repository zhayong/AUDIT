//
//  HistoryViewController.m
//  AUDIT
//
//  Created by Zhayong on 11/21/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "HistoryViewController.h"
#import "LeftCellModel.h"
#import "LeftCell.h"
#import "LookQuestionnaireSurvey.h"

#import "AUDataBase.h"

#define HISTORY_LEFTCELL_SQL @"select distinct submit_id as submitId,subject_start_time as subjectStartTime,dealer_name as dealerName,subject_cost_time as sujectCostTime,subject_complete_count as subjectCompleteCount,subject_total_count as subjectTotalCount from t_submit order by subject_modify_time"

@interface HistoryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *rightTitle;
@property (weak, nonatomic) IBOutlet UIView *leftView;

@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;

@property (nonatomic, strong) NSArray *leftModes;

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查看审核结果";
    self.view.backgroundColor =  ZYColor(240,239, 245);
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
}

- (NSArray *)leftModes
{
    if(_leftModes == nil){
        _leftModes = [NSArray array];
//        _leftModes = [AUDataBase queryWithSql:HISTORY_LEFTCELL_SQL andModelName:@"LeftCellModel"];
        _leftModes = [DataBaseOperation queryWithSql:HISTORY_LEFTCELL_SQL withArgumentsInArray:nil andModelName:@"LeftCellModel"];
    }
    return _leftModes;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == _leftTableView){
        return self.leftModes.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _leftTableView){
        return 120.0;
    }
    return 0.0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     LeftCell *cell = [LeftCell leftCellWithTableView:tableView];
    if(tableView == _leftTableView){
        cell.leftCellMode = self.leftModes[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _leftTableView){
        LeftCellModel *cellMode =  self.leftModes[indexPath.row];
        ;
        [self presentQuestionairViewControllWith:cellMode.submitId];
    }
}

- (void)presentQuestionairViewControllWith:(NSString *)draftId
{
    NSLog(@"添加按钮被点击了");
    LookQuestionnaireSurvey *vc = [[LookQuestionnaireSurvey alloc] init];
    vc.QuestionId = draftId;
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self displayContentViewController:naVC];
    
}

#pragma mark - Container view switching functions
- (void) displayContentViewController: (UIViewController*) contentVC {
    [self addChildViewController:contentVC];
    contentVC.view.frame = [self frameForContentContainer];
    [self.rightView addSubview:contentVC.view];
}

- (CGRect) frameForContentContainer {
    return self.rightView.bounds;
}

-(void)viewDidLayoutSubviews
{
    if ([self.leftTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.leftTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.leftTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.leftTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    if ([self.rightTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.rightTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.rightTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.rightTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


@end
