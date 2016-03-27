//
//  LoginViewController.m
//  AUDIT
//
//  Created by Zhayong on 11/21/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "LoginViewController.h"
#import "CustomTextfield.h"
#import "ZYTabBarController.h"

#define LOGIN_BORDER_COLOR ZYColor(147, 195, 234).CGColor

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (nonatomic, strong) CustomTextfield *userNameField;
@property (nonatomic, strong) CustomTextfield *passwordField;
@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation LoginViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_userNameField endEditing:YES];
    [_passwordField endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    NSLog(@"this is test.");
    CGFloat iconViewY = CGRectGetMaxY(_iconImageView.frame);
    CGFloat padding = 100.0;
    CGFloat fieldW = 400.0;
    CGFloat fieldH = 60.0;
    
    _userNameField = [[CustomTextfield alloc]init];
    _userNameField.bounds = CGRectMake(0, 0, fieldW, fieldH);
    _userNameField.backgroundColor = [UIColor whiteColor];
    _userNameField.layer.masksToBounds = YES;
    _userNameField.layer.borderWidth = 1.0;
    _userNameField.layer.borderColor = LOGIN_BORDER_COLOR;
    _userNameField.delegate = self;
    _userNameField.layer.cornerRadius = ZYcornerRadius;
    
    _userNameField.center = CGPointMake(self.view.center.x, iconViewY + padding);
    
    _userNameField.placeholder = @"用户名";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.firstLineHeadIndent = 20.0;
    _userNameField.attributedPlaceholder = [[NSMutableAttributedString alloc]initWithString:@"用户名" attributes:@{NSParagraphStyleAttributeName:paragraphStyle}];
    
    [self.view addSubview:_userNameField];
    
    _passwordField = [[CustomTextfield alloc]init];
    _passwordField.bounds = CGRectMake(0, 0, fieldW, fieldH);
    _passwordField.backgroundColor = [UIColor whiteColor];
    _passwordField.layer.masksToBounds = YES;
    _passwordField.delegate = self;
    _passwordField.layer.cornerRadius = ZYcornerRadius;
    _passwordField.layer.borderWidth = 1.0;
    _passwordField.layer.borderColor = LOGIN_BORDER_COLOR;
    _passwordField.center = CGPointMake(self.view.center.x, CGRectGetMaxY(_userNameField.frame) + padding / 2);
    _passwordField.attributedPlaceholder = [[NSMutableAttributedString alloc]initWithString:@"密码" attributes:@{NSParagraphStyleAttributeName:paragraphStyle}];
    _passwordField.secureTextEntry = YES;
    [self.view addSubview:_passwordField];
    
    _loginButton = [[UIButton alloc]init];
    _loginButton.bounds = CGRectMake(0, 0, fieldW, fieldH);
    _loginButton.layer.masksToBounds = YES;
    _loginButton.layer.cornerRadius = ZYcornerRadius;
    _loginButton.layer.borderColor = LOGIN_BORDER_COLOR;
    _loginButton.layer.borderWidth = 1.0;
    _loginButton.center = CGPointMake(self.view.center.x, CGRectGetMaxY(_passwordField.frame) + padding);
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:ZYColor(112, 172, 226)];
    [_loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];

    // Do any additional setup after loading the view.
}


#pragma mark - Button responsed
- (void)loginButtonClicked:(UIButton *)sender
{
    ZYTabBarController *tabVc = [[ZYTabBarController alloc]init];
    [self.view.window setRootViewController:tabVc];
    
}

@end
