//
//  ZYDataEngine.h
//  ZY*
//
//  Created by 査勇 on 15/7/13.
//  Copyright (c) 2015年 查勇的小仓库. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^successBlock)(id responseObject);
typedef void (^failtureBlock)(NSError *error);

@interface ZYDataEngine : NSObject

// 本地数据操作
+ (NSString *)getCurrentBundleVersion;

+ (NSString *)generateDealerCode;

// 数据库数据操作

// 网络数据操作

/**
 *  实例化AFHTTPRequestOperationManager
 *
 *  @return manager
 */
+ (AFHTTPRequestOperationManager *)getAFNetworkingManager;

- (void)getDataWithURLString:(NSString *)url parameters:(id)paramters OnSuccess:(successBlock)successBlock OnFailture:(failtureBlock)failtureBlock;

// login
- (BOOL)loginWithUserName:(NSString *)username andPassword:(NSString *)password;

@end
