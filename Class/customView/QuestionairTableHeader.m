//
//  QuestionairTableHeader.m
//  AUDIT
//
//  Created by Zhayong on 11/25/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "QuestionairTableHeader.h"

@interface QuestionairTableHeader ()
{
    double ratio;
}

@end

@implementation QuestionairTableHeader

- (void)awakeFromNib
{
    // set progress
    _trakerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0 , _progressView.height)];
     _trakerImageView.backgroundColor = ZYColor(112, 172, 226);
    [_progressView addSubview:_trakerImageView];
}

- (void)setProgressValueWithCompleteCnt:(NSInteger)completeCnt andTotalCnt:(NSInteger)totalCnt
{
    NSLog(@"%@",NSStringFromCGRect(_progressView.frame));
    ratio = (double)completeCnt / (double)totalCnt;
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    _trakerImageView.frame = CGRectMake(0,0,self.width * ratio, _progressView.height);
    self.frame = CGRectMake(0, 0, self.width, 150);
}

@end
