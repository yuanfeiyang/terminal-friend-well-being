//
//  TRArticelTwoViewController.m
//  TRProject
//
//  Created by Yuanfeiyang on 16/7/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRArticelTwoViewController.h"

@interface TRArticelTwoViewController ()<UIWebViewDelegate>
@property (nonatomic) UIWebView *webView;
@end

@implementation TRArticelTwoViewController

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
        _webView.scalesPageToFit = YES;
        _webView.delegate = self;
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:_idURL];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
