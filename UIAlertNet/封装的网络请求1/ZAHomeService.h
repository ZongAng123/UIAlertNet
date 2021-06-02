//
//  ZAHomeService.h
//  UIAlertNet
//
//  Created by 纵昂 on 2021/5/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZAHomeService : NSObject

//pageNum和action标记参数，可以区分接口类型等
//Alldic为网络请求报文
//url接口地址
//success获取接口成功返回参数
//failure网络请求失败错误信息
- (void)searchMessage:(NSString *)pageNum andWithAction:(NSString *)action andWithDic:(NSDictionary *)Alldic andUrl:(NSString *)url andSuccess:(void(^)(NSDictionary *dic))success andFailure:(void(^)(int fail))failure;


@end

NS_ASSUME_NONNULL_END
