//
//  LetfCell.h
//  AUDIT
//
//  Created by Zhayong on 11/23/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomePageLeftCellModel;

@interface HomePageLeftCell : UITableViewCell

@property (nonatomic, strong) HomePageLeftCellModel *homePageLeftCellModel;

+ (instancetype)HomePageLeftCellWithTableView:(UITableView *)tableView;

@end
