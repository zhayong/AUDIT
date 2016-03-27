//
//  HomepageViewController.m
//  AUDIT
//
//  Created by Zhayong on 11/21/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "HomepageViewController.h"
#import "HPRightViewController.h"

#import "HomePageLeftCell.h"
#import "HomePageLeftCellModel.h"

#import "AUDataBase.h"

#define HOME_LEFTCELL_SQL @"select distinct draft_id as draftId,draft_start_time as draftStartTime,dealer_name as dealerName,draft_cost_time as draftCostTime,subject_complete_count as subjectCompleteCount,subject_total_count as subjectTotalCount from t_draft order by draft_modify_time"

#define MENU_WIDTH 200.0

@interface HomepageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *rightTitle;
@property (weak, nonatomic) IBOutlet UIView *leftView;

@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;

@property (nonatomic, strong) NSArray *leftModes;

@end

@implementation HomepageViewController

- (void)reloadLeftViewData:(NSNotification *)note
{
    [self.leftTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadLeftViewData:) name:@"reloadLeftViewData" object:nil];
    
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor =  ZYColor(240,239, 245);
    
    //
    UIButton *addButton = [[UIButton alloc]init];
    addButton.bounds = CGRectMake(10, 10, _leftTableView.width - 20, 60.0);
    [addButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addButton.layer setMasksToBounds:YES];
    addButton.layer.borderWidth = 2.0;
    addButton.layer.borderColor = ZYColor(239, 240,255).CGColor;
    [addButton addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _leftTableView.tableHeaderView = addButton;
    
    _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSArray *)leftModes
{
//    if(_leftModes == nil){
        _leftModes = [NSArray array];
        _leftModes = [DataBaseOperation queryWithSql:HOME_LEFTCELL_SQL withArgumentsInArray:nil andModelName:@"HomePageLeftCellModel"];
//    }
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
     HomePageLeftCell *cell  = [HomePageLeftCell HomePageLeftCellWithTableView:tableView];
    cell.contentView.frame = CGRectMake(0, 0, 100, 100);
    
    if(tableView == _leftTableView){
        cell.homePageLeftCellModel = self.leftModes[indexPath.row];
        }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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

- (void)menuClicked:(UIButton *)sender
{
    if(self.view.frame.origin.x == 0)
    {
        [UIView animateWithDuration:0.2 animations:^{
            //            self.view.transform = CGAffineTransformMakeTranslation(MENU_WIDTH, 0);
            self.view.frame = CGRectMake(MENU_WIDTH, 0, self.view.width, self.view.height);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.2 animations:^{
            //            tabVc.view.transform = CGAffineTransformMakeTranslation(0, 0);
            self.view.frame = CGRectMake(0, 0, self.view.width, self.view.height);
        }];
    }
}

#pragma mark - Button Response

- (void)addButtonClicked:(UIButton *)sender
{
    NSLog(@"添加按钮被点击了");
    HPRightViewController *vc = [[HPRightViewController alloc] init];
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

@end
