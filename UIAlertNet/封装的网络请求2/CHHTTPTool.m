//
//  CHHTTPTool.m
//  UIAlertNet
//
//  Created by 纵昂 on 2021/5/30.
// iOS 网络请求（基于AFNetworking的再次封装）
//

#import "CHHTTPTool.h"

@implementation CHHTTPTool

static CHHTTPTool *_instance = nil;

+ (instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self manager];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
        
        // 设置所有接口公用的header
        NSDictionary *header = @{
                               @"TOKEN": @"XXXXXXXXXXX",
                               @"USERID": @"XXXXXXXXXXX"
                               };
        [_instance setHTTPHeaderKeyValues:header];
    });
    return _instance;
}

// 设置请求头
- (void)setHTTPHeaderKeyValues:(NSDictionary *)header {
    if (header) {
        [header enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [self.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
}

/**
 *  发送get请求
 */
- (NSURLSessionDataTask *)GET:(NSString *)url
                       params:(id)params
          httpHeaderKeyValues:(NSDictionary *)header
                     progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    /**
     *  可以接受的类型
     */
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    /**
     *  请求超时的时间
     */
    self.requestSerializer.timeoutInterval = 30;
    
    /**
     *  Header 请求头
     */
    if (header) {
        [self setHTTPHeaderKeyValues:header];
    }
    
//    NSURLSessionDataTask *task = [self GET:url parameters:params progress:downloadProgressBlock success:success failure:failure];
    NSURLSessionDataTask *task = [self GET:url parameters:params headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
    }];
    
    return task;
}

- (NSURLSessionDataTask *)GET:(NSString *)url
                       params:(id)params
                     progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    return [self GET:url params:params httpHeaderKeyValues:@{} progress:downloadProgressBlock success:success failure:failure];
}

/**
 *  发送post请求
 */
- (NSURLSessionDataTask *)POST:(NSString *)url
                        params:(id)params
           httpHeaderKeyValues:(NSDictionary *)header
                      progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                       success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                       failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    /**
     *  可以接受的类型
     */
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    /**
     *  请求超时的时间
     */
    self.requestSerializer.timeoutInterval = 30;
    
    /**
     *  Header 请求头
     */
    if (header) {
        [self setHTTPHeaderKeyValues:header];
    }
    
    NSURLSessionDataTask *task = [self POST:url params:params httpHeaderKeyValues:header progress:downloadProgressBlock success:success failure:failure];
    
    return task;
}

- (NSURLSessionDataTask *)POST:(NSString *)url
                        params:(id)params
                      progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                       success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                       failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    return [self POST:url params:params httpHeaderKeyValues:@{} progress:downloadProgressBlock success:success failure:failure];
}

/**
 *  上传文件
 */
- (NSURLSessionDataTask *)upload:(NSString *)url
                      params:(id)params
             httpHeaderKeyValues:(NSDictionary *)header
       constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))formDataBlock
                         success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                         failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    /**
     *  可以接受的类型
     */
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    /**
     *  请求超时的时间
     */
    self.requestSerializer.timeoutInterval = 30;
    
    /**
     *  Header 请求头
     */
    if (header) {
        [self setHTTPHeaderKeyValues:header];
    }
    
//    NSURLSessionDataTask *task = [self POST:url parameters:params constructingBodyWithBlock:formDataBlock progress:nil success:success failure:failure];
    NSURLSessionDataTask *task = [self POST:url parameters:params headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    return task;
}

- (NSURLSessionDataTask *)upload:(NSString *)url
                      params:(id)params
       constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))formDataBlock
                         success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                         failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    return [self upload:url params:params httpHeaderKeyValues:@{} constructingBodyWithBlock:formDataBlock success:success failure:failure];
}


/**
 *  下载
 */
- (NSURLSessionDownloadTask *)download:(NSString *)url
                            params:(id)params
                   httpHeaderKeyValues:(NSDictionary *)header
                              progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                           destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
                     completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler {
    /**
     *  Header 请求头
     */
    if (header) {
        [self setHTTPHeaderKeyValues:header];
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSessionDownloadTask *task = [self downloadTaskWithRequest:request progress:downloadProgressBlock destination:destination completionHandler:completionHandler];
    [task resume];
    return task;
}

- (NSURLSessionDownloadTask *)download:(NSString *)url
                            params:(id)params
                              progress:(void (^)(NSProgress *downloadProgress))downloadProgressBlock
                           destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
                     completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler {
    return [self download:url params:params httpHeaderKeyValues:@{} progress:downloadProgressBlock destination:destination completionHandler:completionHandler];
}





@end
