//
//  LetfCell.h
//  AUDIT
//
//  Created by Zhayong on 11/23/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LeftCellModel;

@interface LeftCell : UITableViewCell

@property (nonatomic, strong) LeftCellModel *leftCellMode;

+ (instancetype)leftCellWithTableView:(UITableView *)tableView;

@end
