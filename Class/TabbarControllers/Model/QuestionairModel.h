//
//  QuestionairModel.h
//  AUDIT
//
//  Created by Zhayong on 11/26/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionairModel : NSObject

@property (nonatomic, copy) NSString *subjectNumber;
@property (nonatomic, copy) NSString *subjectContext;
@property (nonatomic, copy) NSString *subjectImage;
@property (nonatomic, copy) NSString *subjectRemark;
@property (nonatomic, copy) NSString *subjectAnswer;

@property (nonatomic, copy) NSString *draftId;
@property (nonatomic, copy) NSString *dealerCode;
@property (nonatomic, copy) NSString *dealerName;
@property (nonatomic, copy) NSString *dealerType;
@property (nonatomic, copy) NSString *dealerSecondaryType;

@property (nonatomic, copy) NSString *auditContextType;

@property (nonatomic, copy) NSString *draftStartTime;
@property (nonatomic, copy) NSString *draftModifyTime;
@property (nonatomic, copy) NSString *draftCostTime;

@property (nonatomic, copy) NSString *subjectCompleteCount;
@property (nonatomic, copy) NSString *subjectTotalCount;









@end
