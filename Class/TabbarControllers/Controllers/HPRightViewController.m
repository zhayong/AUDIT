//
//  HPRightViewController.m
//  AUDIT
//
//  Created by Zhayong on 11/25/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "HPRightViewController.h"
#import "ParameterSelectViewController.h"
#import "CustomButton.h"

#import "DealerInfo.h"

@interface HPRightViewController ()
@property (weak, nonatomic) IBOutlet UIView *dealerCodeView;
@property (weak, nonatomic) IBOutlet UILabel *codeLable;
@property (weak, nonatomic) IBOutlet UIView *nameLable;
@property (weak, nonatomic) IBOutlet UIView *checkBoxView;
@property (weak, nonatomic) IBOutlet UIButton *createButton;
@property (weak, nonatomic) IBOutlet UITextField *dealerNameTextField;

@property (nonatomic, strong) CustomButton *firstType;
@property (nonatomic, strong) CustomButton *secondType;
@property (nonatomic, strong) CustomButton *thirdType;
@property (nonatomic, strong) CustomButton *fourthType;

@property (nonatomic, copy) NSString *dealerType;

@end

@implementation HPRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"经销商审核";
    _dealerCodeView.layer.masksToBounds = YES;
    _dealerCodeView.layer.borderColor = ZYColor(112, 172, 226).CGColor;
    _dealerCodeView.layer.cornerRadius = ZYcornerRadius;
    _dealerCodeView.layer.borderWidth = 1.0;
    
    _codeLable.text = [ZYDataEngine generateDealerCode];
    
    //
    CGFloat buttonW = 80.0;
    CGFloat padding = 30.0;
    _firstType = [self createButtonWithX:buttonW * 0  + 10.0 andTitle:@"4S" andtag:101];
    _secondType =  [self createButtonWithX:buttonW * 1 + padding + 10.0 andTitle:@"SC" andtag:102];
    _thirdType = [self createButtonWithX:(buttonW + padding) * 2 + 10.0  andTitle:@"FLR" andtag:103];
    _fourthType = [self createButtonWithX:(buttonW + padding) * 3 + 10.0 andTitle:@"BP" andtag:104];
    
    // Do any additional setup after loading the view from its nib.
}

- (CustomButton *)createButtonWithX:(CGFloat)x andTitle:(NSString *)title andtag:(NSInteger)tag
{
    CGFloat buttonW = 60.0;
    CGFloat buttonH = 30.0;
    CGFloat buttonY = 0.0;
    
    CustomButton *button = [[CustomButton alloc]init];
    button.frame = CGRectMake(x, buttonY, buttonW, buttonH);
    [button setImage:[UIImage imageNamed:@"checkBox"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"home_checkBox"] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(typeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.tag = tag;
    [_checkBoxView addSubview:button];
    return button;
}

#pragma mark - Button Response

- (void)typeButtonClicked:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if(sender.tag == 101){
        NSLog(@"4S");
        _secondType.selected = NO;
        _thirdType.selected = NO;
        _fourthType.selected = NO;
        
    }
    if(sender.tag == 102){
        NSLog(@"SC");
        _firstType.selected = NO;
        _thirdType.selected = NO;
        _fourthType.selected = NO;
    }
    if(sender.tag == 103){
        NSLog(@"FLR");
        _secondType.selected = NO;
        _firstType.selected = NO;
        _fourthType.selected = NO;

        
    }
    if(sender.tag == 104){
        NSLog(@"BP");
        _secondType.selected = NO;
        _thirdType.selected = NO;
        _firstType.selected = NO;
    }
    _dealerType = sender.titleLabel.text;
}

- (IBAction)createButtonClicked:(UIButton *)sender {
    
    //
    if(_dealerType == nil || _dealerNameTextField.text == nil || [_dealerNameTextField.text isEqualToString: @""]){
        UIAlertController *alerVc = [UIAlertController alertControllerWithTitle:nil message:@"请认真填写完所有信息！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alerVc addAction:cancelAction];
        [alerVc addAction:okAction];
        [self presentViewController:alerVc animated:YES completion:^{
            
        }];
        
    }else{
    
        CATransition *transition = [CATransition animation];
        transition.duration = 0.5;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
        
        ParameterSelectViewController *parameterSelterVc = [[ParameterSelectViewController alloc]initWithNibName:@"ParameterSelectViewController" bundle:nil];
        DealerInfo *dealerInfo = [DealerInfo new];
        dealerInfo.dealerCode = _codeLable.text;
        dealerInfo.dealerName = _dealerNameTextField.text;
        dealerInfo.dealerType = _dealerType;
        parameterSelterVc.dealerInfo = dealerInfo;
        [self.navigationController pushViewController:parameterSelterVc animated:NO];

    }
    
}

#pragma mark - UIGestureRecognizer
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_dealerNameTextField endEditing:YES];
}

@end
