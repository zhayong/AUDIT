//
//  AUDataBase.m
//  AUDIT
//
//  Created by Zhayong on 11/26/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "AUDataBase.h"
#import "ZYFileManager.h"

@implementation AUDataBase

+ (AUDataBase *)auditDataBase
{
    AUDataBase *db;
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [path stringByAppendingString:@"/draft.sqlite"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:filePath]){
        // 创建数据库
        NSString *defaultDBPath = [[NSBundle mainBundle] pathForResource:@"draft" ofType:@"sqlite"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error;
        [fileManager copyItemAtPath:defaultDBPath toPath:filePath error:&error];
    }
    db = [AUDataBase databaseWithPath:filePath];
    return db;
}

@end
