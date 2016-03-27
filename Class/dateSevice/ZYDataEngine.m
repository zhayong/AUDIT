//
//  ZYDataEngine.m
//  ZY*
//
//  Created by 査勇 on 15/7/13.
//  Copyright (c) 2015年 查勇的小仓库. All rights reserved.
//

#import "ZYDataEngine.h"

#define orginCode @"201501102"

@implementation ZYDataEngine

// 本地数据操作
+ (NSString *)getCurrentBundleVersion
{
    NSString *key = @"CFBundleVersion";

    // 获取当前使用软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    return currentVersion;
}

+ (NSString *)generateDealerCode
{
    // 从沙河获取上次使用的经销商代码
    NSString *lastDealerCode = [[NSUserDefaults standardUserDefaults] objectForKey:@"dealerCode"];
    if(!lastDealerCode){
        [[NSUserDefaults standardUserDefaults] setObject:orginCode forKey:@"dealerCode"];
    }
    NSString *currentCode = [NSString stringWithFormat:@"%d",[lastDealerCode integerValue]+ 1];
    // 存储当前使用的经销商代码
    [[NSUserDefaults standardUserDefaults] setObject:currentCode forKey:@"dealerCode"];
    return currentCode;
}

/**
 *  实例化AFHTTPRequestOperationManager
 *
 *  @return manager
 */
+ (AFHTTPRequestOperationManager *)getAFNetworkingManager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    return manager;
}
/**
 *  示例
 *
 *  @param url           请求地址
 *  @param paramters     参数
 *  @param successBlock  请求成功
 *  @param failtureBlock 请求失败
 */
- (void)getDataWithURLString:(NSString *)url parameters:(id)paramters OnSuccess:(successBlock)successBlock OnFailture:(failtureBlock)failtureBlock
{
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:paramters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failtureBlock(error);
    }];

}

//- (BOOL)loginWithUserName:(NSString *)username andPassword:(NSString *)password
//{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager POST: parameters:@{} constructingBodyWithBlock:<#^(id<AFMultipartFormData>  _Nonnull formData)block#> success:<#^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)success#> failure:<#^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error)failure#>]
//
//}

// 



@end
