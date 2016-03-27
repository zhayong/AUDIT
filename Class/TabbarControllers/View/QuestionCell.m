//
//  QuestionCell.m
//  AUDIT
//
//  Created by Zhayong on 11/26/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "QuestionCell.h"

@interface QuestionCell()
{
    UIButton *yesButton,*noButton,*pendingButton;
}
@property (weak, nonatomic) IBOutlet UIView *SubjectNumberView;
@property (weak, nonatomic) IBOutlet UILabel *subjectNumber;
@property (weak, nonatomic) IBOutlet UILabel *QcontextLable;

@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property (weak, nonatomic) IBOutlet UILabel *remarkLable;
@property (weak, nonatomic) IBOutlet UIView *ImagesView;

@end

@implementation QuestionCell

+ (instancetype)questionCellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"ID";
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        // 从xib加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"QuestionCell" owner:nil options:nil] lastObject];
    }
    return cell;

}

- (void)setQuestionairModel:(QuestionairModel *)questionairModel
{
    _questionairModel = questionairModel;
    _subjectNumber.text = questionairModel.subjectNumber;
    _QcontextLable.text = questionairModel.subjectContext;
    _remarkLable.text = questionairModel.subjectRemark;

}

- (UIButton *)createButtonWithX:(CGFloat)x andNormalImageName:(NSString *)imageName andSelectedImageName:(NSString *)selectedImageName andTitle:(NSString *)buttonTitle
{
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(x, 0, _buttonView.width / 4, _buttonView.height);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    
    [button setTitleColor:ZYColor(206, 206, 206) forState:UIControlStateNormal];
    [button setTitleColor:ZYColor(153, 153, 153) forState:UIControlStateSelected];
    
    [self.buttonView addSubview:button];
    
    return button;
    
}

- (void)awakeFromNib {
    // Initialization code
    CGFloat buttonW = _buttonView.width / 4;
    
    yesButton = [self createButtonWithX: buttonW * 0 andNormalImageName:@"" andSelectedImageName:@"" andTitle:@"是"];
    yesButton.tag = 11;
    [yesButton addTarget:self action:@selector(ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    noButton = [self createButtonWithX:buttonW andNormalImageName:@"" andSelectedImageName:@"" andTitle:@"否"];
    noButton.tag = 10;
    [noButton addTarget:self action:@selector(ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    pendingButton = [self createButtonWithX:buttonW * 2 andNormalImageName:@"" andSelectedImageName:@"" andTitle:@"待定"];
    pendingButton.tag = 12;
    [pendingButton addTarget:self action:@selector(ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [_SubjectNumberView.layer setBorderWidth:1.0];
    [_SubjectNumberView.layer setBorderColor:ZYColor(239,240,255).CGColor];
    
    [_remarkLable.layer setMasksToBounds:YES];
    [_remarkLable.layer setBorderColor:ZYColor(239,240,255).CGColor];
    [_remarkLable.layer setBorderWidth:1.0];
    [_remarkLable.layer setCornerRadius:ZYcornerRadius];
    
}

//- (void)layoutSubviews
//{
//    [super layoutIfNeeded];
//    
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - Button Response

- (void)ButtonClicked:(UIButton *)sender
{
    NSLog(@"按钮被点击了");
    sender.selected = !sender.selected;
    
    if(sender.tag == 10){
        // no
            yesButton.selected = NO;
            pendingButton.selected = NO;
        [_questionCellDelegate buttonClicked:sender inView:self];
    }
    if(sender.tag == 11){
        // yes
            noButton.selected = NO;
            pendingButton.selected = NO;
         [_questionCellDelegate buttonClicked:sender inView:self];
    }
    if(sender.tag == 12){
        // pedding
            yesButton.selected = NO;
            noButton.selected = NO;
         [_questionCellDelegate buttonClicked:sender inView:self];
    }
}


@end
