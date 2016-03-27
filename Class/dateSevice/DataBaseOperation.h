//
//  DataBaseOperation.h
//  AUDIT
//
//  Created by Zhayong on 11/30/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseOperation : NSObject

+ (NSArray *)queryWithSql:(NSString *)sql withArgumentsInArray:(NSArray *)argument andModelName:(NSString *)modelName;

+ (BOOL)insertWithSql:(NSString *)sql withArgumentsInArray:(NSArray *)argument;

//-(NSArray*)superSearchUsingQuery:(NSString*)query withAliasNams:(NSArray*)alias andParameters: (NSArray*) paraArray inDataBase:(FMDatabase*)db;

@end
