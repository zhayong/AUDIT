//
//  QuestionairTableHeader.h
//  AUDIT
//
//  Created by Zhayong on 11/25/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QuestionairTableHeaderDelegate <NSObject>


@end

@interface QuestionairTableHeader : UIView

@property (strong, nonatomic) IBOutlet UIView *progressView;
@property (nonatomic, strong) UIImageView *trakerImageView;

- (void)setProgressValueWithCompleteCnt:(NSInteger)completeCnt andTotalCnt:(NSInteger)totalCnt;

@end
