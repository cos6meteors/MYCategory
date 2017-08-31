//
//  HttpRequest.m
//  AfnHttpsSSLDemo
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HttpRequest.h"
#import <AFNetworking/AFNetworking.h>

/**
 *  是否开启https SSL 验证
 *
 *  @return YES为开启，NO为关闭
 */
#define openHttpsSSL YES
/**
 *  SSL 证书名称，仅支持cer格式。“app.bishe.com.cer”,则填“app.bishe.com”
 */
#define certificate @"adn"

@implementation HttpRequest

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20;
    
    if (openHttpsSSL) {
        [manager setSecurityPolicy:[self customSecurityPolicy]];
    }
    
    [manager POST:@"http://example.com/resources.json" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if (success) {
            success(responseObject);
        }
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (error) {
            failure(error);
        }
        NSLog(@"Error: %@", error);
    }];
}

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20;
    
    if (openHttpsSSL) {
        [manager setSecurityPolicy:[self customSecurityPolicy]];
    }
    
    [manager GET:@"http://example.com/resources.json" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if (success) {
            success(responseObject);
        }
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (error) {
            failure(error);
        }
        NSLog(@"Error: %@", error);
    }];
}

+ (AFSecurityPolicy*)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:certificate ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    securityPolicy.pinnedCertificates = @[certData];
    
    return securityPolicy;
}
@end
