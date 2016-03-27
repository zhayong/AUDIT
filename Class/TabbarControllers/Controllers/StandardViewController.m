//
//  StandardViewController.m
//  AUDIT
//
//  Created by Zhayong on 11/25/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "StandardViewController.h"
#import "QuestionnaireSurvey.h"
#import "DealerInfo.h"
#import "DateHelper.h"

#define insertData @"insert into t_draft (draft_id,dealer_name,dealer_code,dealer_type,draft_start_time)values (?,?,?,?,?)"

@interface StandardViewController ()

@end

@implementation StandardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.title = @"经销商审核";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextStepClicked:(UIButton *)sender {
    
    // 将数据插入数据库
    //
    NSString *currentTime = [[DateHelper new] draftTime];
    BOOL success =  [DataBaseOperation insertWithSql:insertData withArgumentsInArray:@[@"3",_dealerInfo.dealerName,_dealerInfo.dealerCode,_dealerInfo.dealerType,currentTime]];
    if(success){
         [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadLeftViewData" object:nil];
    }
   
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    QuestionnaireSurvey *questionnaireSurvey = [[QuestionnaireSurvey alloc]init];
    questionnaireSurvey.QuestionId = @"1";
    [self.navigationController pushViewController:questionnaireSurvey animated:NO];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
