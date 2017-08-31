//
//  ViewController.m
//  YMCategory
//
//  Created by Murphy Zheng on 17/8/31.
//  Copyright © 2017年 mieasy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


+ (NSDictionary *)uploadStreamOfImage:(UIImage *)image url:(NSString *)url {
    //压缩图片
    NSData *imageData = UIImageJPEGRepresentation(image, 0.000001);
    
    NSTimeInterval timeInterVal = 20;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:timeInterVal];
    request.HTTPMethod = @"POST";
    //分界线的标识符
    NSString *TWITTERFON_FORM_BOUNDARY = @"AaB03x";
    
    //分界线 --AaB03x
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
    //结束符 AaB03x--
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
    
    NSMutableString *body=[[NSMutableString alloc] init];
    //添加分界线，换行
    [body appendFormat:@"%@\r\n",MPboundary];
    
    NSDate* dateNow = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time = [dateNow timeIntervalSince1970] * 1000;
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    
    [body appendFormat:@"%@", [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"VegFile\"; filename=\"%@\"\r\n",timeString]];
    //声明上传文件的格式
    [body appendFormat:@"Content-Type: image/jpg\r\n\r\n"];
    
    NSLog(@"网络请求body:%@",body);
    //声明结束符：--AaB03x--
    NSString *end=[[NSString alloc] initWithFormat:@"\r\n%@",endMPboundary];
    NSMutableData *requestData = [NSMutableData data];
    [requestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    //将image的data加入
    [requestData appendData:imageData];
    //加入结束符--AaB03x--
    [requestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    
    //设置HTTPHeader中Content-Type的值
    NSString *content=[[NSString alloc] initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
    //设置HTTPHeader
    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    //设置Content-Length
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
    //设置http body
    [request setHTTPBody:requestData];
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    NSMutableDictionary *responseDict = [NSMutableDictionary dictionary];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //网络请求失败
        
        if (error != nil) {
            return;
        }
        //成功进行解析
        NSMutableDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"success,response:%@--%@",dic, response);
    }];
    
    [task resume];
    return responseDict;
}

@end
