//
//  ParameterSelectViewController.m
//  AUDIT
//
//  Created by Zhayong on 11/25/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "ParameterSelectViewController.h"
#import "StandardViewController.h"

@interface ParameterSelectViewController ()

@end

@implementation ParameterSelectViewController

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
- (IBAction)nextStepButtonClicked:(UIButton *)sender {
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    StandardViewController *standardVc = [[StandardViewController alloc]initWithNibName:@"StandardViewController" bundle:nil];
    standardVc.dealerInfo = _dealerInfo;
    [self.navigationController pushViewController:standardVc animated:NO];
    
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
