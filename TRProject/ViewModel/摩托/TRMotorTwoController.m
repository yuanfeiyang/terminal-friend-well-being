//
//  TRMotorTwoController.m
//  TRProject
//
//  Created by spare on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMotorTwoController.h"

@interface TRMotorTwoController ()<UIWebViewDelegate>
/** <#属性描述#> */
@property (nonatomic) UIWebView *webView;
@end

@implementation TRMotorTwoController

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        _webView.scalesPageToFit = YES;
        _webView.delegate = self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:_webUrl];
    [self.webView loadRequest:request];
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    //需求：使用oc语言调用js代码;删除html存在的p标签
    //NSString *getDeletePString = @"var pElement = document.getElementsByTagName('div').item(5);pElement.remove();";
    NSString *getDeletePStringq = @"var pElement = document.getElementsByTagName('div').item(4);pElement.remove();";
    
    //NSString *getDeletePString1 = @"var pElement = document.getElementsByClassName('Reading ng-scope')[0];pElement.remove();";
    
    //[webView stringByEvaluatingJavaScriptFromString:getDeletePString1];
    [webView stringByEvaluatingJavaScriptFromString:getDeletePStringq];
    //[webView stringByEvaluatingJavaScriptFromString:getDeletePString];
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
