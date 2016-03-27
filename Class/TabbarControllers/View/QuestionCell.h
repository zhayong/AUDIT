//
//  QuestionCell.h
//  AUDIT
//
//  Created by Zhayong on 11/26/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionairModel.h"

@class QuestionCell;

@protocol QuestionCellDelegate <NSObject>

- (void)buttonClicked:(UIButton *)sender inView:(QuestionCell *)questionCell;

@end

@interface QuestionCell : UITableViewCell

@property (nonatomic, strong) QuestionairModel *questionairModel;

@property (nonatomic, weak) id <QuestionCellDelegate> questionCellDelegate;

@property (nonatomic, assign) NSInteger index;

+ (instancetype)questionCellWithTableView:(UITableView *)tableView;
@end
