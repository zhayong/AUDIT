//
//  QuestionnaireSurvey.m
//  AUDIT
//
//  Created by Zhayong on 11/25/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "LookQuestionairTableHeader.h"
#import "LookQuestionnaireSurvey.h"
#import "QuestionCell.h"
#import "QuestionairModel.h"

#import "AUDataBase.h"

#define SELECTQ @"select subject_number as subjectNumber,subject_context as subjectContext,subject_image as subjectImage,subject_remark as subjectRemark,subject_answer as subjectAnswer,draft_id as draftId,dealer_code as dealerCode,dealer_name as dealerName,dealer_type as dealerType,dealer_secondary_type as dealerSecondaryType,audit_context_type as auditContextType,draft_start_time as draftStartTime,draft_modify_time as draftModifyTime,draft_cost_time as draftCostTime,subject_complete_count as subjectCompleteCount,subject_total_count as subjectTotalCount from t_draft where draft_id = ? order by draftModifyTime"

@interface LookQuestionnaireSurvey ()<QuestionCellDelegate>

@property (nonatomic, strong) NSArray *Qmodels;
@property (nonatomic, strong) NSMutableArray *indexArray;
@end


@implementation LookQuestionnaireSurvey

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"查看审核结果";
    self.navigationItem.hidesBackButton = YES;
    // 改变索引的颜色
    self.tableView.sectionIndexColor = [UIColor blueColor];
//    // 改变索引选中的背景颜色
//    self.tableView.sectionIndexTrackingBackgroundColor = [UIColor grayColor];
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    LookQuestionairTableHeader *headerView = [[[NSBundle mainBundle]loadNibNamed:@"LookQuestionairTableHeader" owner:nil options:nil] lastObject];
    [headerView setProgressValueWithCompleteCnt:7 andTotalCnt:14];
    
    self.tableView.tableHeaderView = headerView;
    self.tableView.rowHeight = 200.0;
}

- (NSArray *)Qmodels
{
    if(_Qmodels == nil){
        _Qmodels = [NSArray array];
        _indexArray = [NSMutableArray array];
        
        _Qmodels = [DataBaseOperation queryWithSql:SELECTQ withArgumentsInArray:@[_QuestionId] andModelName:@"QuestionairModel"];
        for(QuestionairModel *qmodel in _Qmodels){
            [_indexArray addObject:qmodel.subjectNumber];
        }
        [self.tableView reloadData];
    }
    return _Qmodels;
}


#pragma mark - Table view data source
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.Qmodels.count;
}

//返回索引数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.indexArray;
}

//响应点击索引时的委托方法
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger count = 0;
    
    NSLog(@"%@-%d",title,index);
    
    for(NSString *character in self.indexArray)
    {
        if([character isEqualToString:title])
        {
            return count;
        }
        count ++;
    }
    return 0;
}

//返回每个索引的内容
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [self.indexArray objectAtIndex:section];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    QuestionCell *cell = [QuestionCell questionCellWithTableView:tableView];
    //
    cell.questionairModel = self.Qmodels[indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.index = indexPath.section;
    cell.questionCellDelegate = self;
    return cell;
}

#pragma mark - questionCellDelegate

- (void)buttonClicked:(UIButton *)sender inView:(QuestionCell *)questionCell
{
    NSMutableArray *anwerArr = [[NSMutableArray alloc]initWithCapacity:[questionCell.questionairModel.subjectTotalCount integerValue]];
//    [anwerArr replaceObjectAtIndex:questionCell.index withObject:[NSString stringWithFormat:@"%ld",(long)sender.tag]];
}

@end
