//
//  AUDataBase.h
//  AUDIT
//
//  Created by Zhayong on 11/26/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDatabase.h>

@interface AUDataBase : FMDatabase

+ (AUDataBase *)auditDataBase;

@end
