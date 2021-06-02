//
//  ZAHomeService.m
//  UIAlertNet
//
//  Created by 纵昂 on 2021/5/29.
//

#import "ZAHomeService.h"

@implementation ZAHomeService

- (void)searchMessage:(NSString *)pageNum andWithAction:(NSString *)action andWithDic:(NSDictionary *)Alldic andUrl:(NSString *)url andSuccess:(void (^)(NSDictionary *))success andFailure:(void (^)(int))failure{

    //1.创建ADHTTPSESSIONMANGER对象
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    //2.设置该对象返回类型
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];

    if ([pageNum isEqualToString:[NSString stringWithFormat:@"get"]]) {

        NSString *urlstr= [NSString stringWithFormat:@"%@%@",HeadUrlPrefix,url];

        NSLog(@"%@",urlstr);
        //调出请求头
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        //将token封装入请求头

        NSUserDefaults *tokenid = [NSUserDefaults standardUserDefaults];
        NSString *token = [tokenid objectForKey:@"tokenid"];
        NSLog(@"%@",token);

        [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];

//        [manager GET:urlstr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSDictionary *dic = responseObject;
//            success(dic);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        }];
        [manager GET:urlstr parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dic = responseObject;
            success(dic);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];

    }else {
            NSString *urlstr= [NSString stringWithFormat:@"%@%@",HeadUrlPrefix,url];
            NSLog(@"%@",urlstr);
            [manager.requestSerializer setValue:@"1" forHTTPHeaderField:@"x-signature"];
            [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"x-timestamp"];
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
//            [manager POST:urlstr parameters:Alldic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//                  NSDictionary *dic = responseObject;
//
//                  success(dic);
//
//              }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                  failure(404);
//              }];
        
        [manager POST:urlstr parameters:Alldic headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dic = responseObject;
            success(dic);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(404);
        }];
    }
}

@end
