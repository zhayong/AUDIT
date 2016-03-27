//
//  DataBaseOperation.m
//  AUDIT
//
//  Created by Zhayong on 11/30/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "DataBaseOperation.h"
#import "AUDataBase.h"
#import <objc/runtime.h>

@implementation DataBaseOperation

+ (BOOL)insertWithSql:(NSString *)sql withArgumentsInArray:(NSArray *)argument
{
    AUDataBase *db = [AUDataBase auditDataBase];
    BOOL result = NO;
    if(![db open]){
        [db open];
    }
    result = [db executeUpdate:sql withArgumentsInArray:argument];
    [db close];
    return result;
}

+ (NSArray *)queryWithSql:(NSString *)sql withArgumentsInArray:(NSArray *)argument andModelName:(NSString *)modelName
{
    
    AUDataBase *db = [AUDataBase auditDataBase];
    if(![db open]){
        [db open];
    }
    FMResultSet *result = [db executeQuery:sql withArgumentsInArray:argument];
    NSMutableArray* modelArray = [[NSMutableArray alloc]init];
    NSMutableArray* columnArray = [[NSMutableArray alloc]init];
    
    //
    Class modelClass = NSClassFromString(modelName);
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(modelClass, &outCount);
    
    for (i = 0; i < outCount; i++)
    {
        @autoreleasepool {
            objc_property_t property = properties[i];
            
            NSString *propName = [NSString stringWithUTF8String:property_getName(property)];
            [columnArray addObject:propName];
        }
        
    }
    while ([result next]) {
        id model = [[modelClass alloc]init];
        //        QuestionairModel *qmode = [[QuestionairModel alloc]init];
        for(NSString *columnName in columnArray){
            NSString* columnValue = [result stringForColumn:columnName];
            //            objc_setAssociatedObject(qmode, [columnName UTF8String],columnValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [model setValue:columnValue forKey:columnName];
        }
        [modelArray addObject:model];
    }
    [db close];
    return modelArray;
    
}

-(NSArray*)superSearchUsingQuery:(NSString*)query withAliasNams:(NSArray*)alias andParameters: (NSArray*) paraArray inDataBase:(FMDatabase*)db
{
    FMResultSet* result = [db executeQuery:query withArgumentsInArray:paraArray];
    NSMutableArray* resultArray = [[NSMutableArray alloc]init];
    while ([result next])
    {
        id object = [[NSObject alloc]init];
        for (NSString* key in alias)
        {
            @autoreleasepool {
                NSString* columnValue = [result stringForColumn:key];
                objc_setAssociatedObject(object, [key UTF8String],columnValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            
        }
        
        [resultArray addObject:object];
    }
    return resultArray;
    
}

@end
