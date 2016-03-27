//
//  AnswerModel.h
//  AUDIT
//
//  Created by Zhayong on 11/26/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnswerModel : NSObject

@property (nonatomic, copy) NSString *subjectAnswer;
@property (nonatomic, copy) NSString *subjectNumber;

@property (nonatomic, copy) NSString *draftStartTime;
@property (nonatomic, copy) NSString *draftModifyTime;
@property (nonatomic, copy) NSString *draftCostTime;

@end
