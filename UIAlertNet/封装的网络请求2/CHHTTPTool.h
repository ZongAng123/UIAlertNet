//
//  CHHTTPTool.h
//  UIAlertNet
//
//  Created by 纵昂 on 2021/5/30.
//  iOS 网络请求（基于AFNetworking的再次封装）
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface CHHTTPTool : AFHTTPSessionManager
/*
 说到AFNetworking，应该是现在应用的最广泛的第三方库了，而且封装的非常好了，不少人拿过AFN之后，直接使用了，也没什么问题，最多接口不统一，维护困难一些～
 不过最好还是对AFN再进行维护一番比较好。
 */
+ (instancetype)shareInstance;

/**
 *  发送get请求
 *
 *  @param url                      请求路径
 *  @param params               请求参数
 *  @param header                   请求头Header
 *  @param downloadProgressBlock    网络请求进度
 *  @param success                  请求成功后的回调,参数为id类型
 *  @param failure                  请求失败后的回调
 */

- (NSURLSessionDataTask *)GET:(NSString *)url
                       params:(id)params
          httpHeaderKeyValues:(NSDictionary *)header
                     progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

- (NSURLSessionDataTask *)GET:(NSString *)url
                       params:(id)params
                     progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;


/**
 *  发送post请求
 *
 *  @param url          请求路径
 *  @param params   请求参数
 *  @param header       请求头Header
 *  @param success      请求成功后的回调,参数为id类型
 *  @param failure      请求失败后的回调
 */

- (NSURLSessionDataTask *)POST:(NSString *)url
                        params:(id)params
           httpHeaderKeyValues:(NSDictionary *)header
                      progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                       success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                       failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

- (NSURLSessionDataTask *)POST:(NSString *)url
                        params:(id)params
                      progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                       success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                       failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;


/**
 *  上传文件
 *
 *  @param url              请求路径
 *  @param params       请求参数
 *  @param header           请求头Header
 *  @param formDataBlock    上传文件的信息
 *  @param success          请求成功后的回调,参数为id类型
 *  @param failure          请求失败后的回调
 */
- (NSURLSessionDataTask *)upload:(NSString *)url
                          params:(id)params
             httpHeaderKeyValues:(NSDictionary *)header
       constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))formDataBlock
                         success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                         failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

- (NSURLSessionDataTask *)upload:(NSString *)url
                          params:(id)params
       constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))formDataBlock
                         success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                         failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;


/**
 *  下载
 *
 *  @param url                      请求路径
 *  @param params               请求参数
 *  @param header                   请求头Header
 *  @param downloadProgressBlock    下载进度
 *  @param destination              请求成功后的回调,参数为id类型
 *  @param completionHandler        请求失败后的回调
 */

- (NSURLSessionDownloadTask *)download:(NSString *)url
                                params:(id)params
                   httpHeaderKeyValues:(NSDictionary *)header
                              progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                           destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
                     completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler;

- (NSURLSessionDownloadTask *)download:(NSString *)url
                                params:(id)params
                              progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                           destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
                     completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler;





@end

NS_ASSUME_NONNULL_END
