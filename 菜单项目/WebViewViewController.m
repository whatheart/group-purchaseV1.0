//
//  WebViewViewController.m
//  菜单项目
//
//  Created by tarena1 on 15/1/17.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()
@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)UIView *loadingView;
//活动转换器
@property(nonatomic,strong)UIActivityIndicatorView *activityIndicatorView;
@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.businessName;
//    隐藏navigation Bar当滑动时
    //self.navigationController.hidesBarsOnSwipe = YES;
//    webView
    self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
//    下载路径请求
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]];
    [self.webView loadRequest:request];
    self.webView.delegate= self;
    
}
//实现里面的方法 开始加载
-(void)webViewDidStartLoad:(UIWebView *)webView{
    self.loadingView = [[UIView alloc]initWithFrame:self.view.frame];
    self.loadingView.backgroundColor = [UIColor blackColor];
    self.loadingView.alpha = 0.5;
//    [self.view addSubview:self.loadingView];
    self.activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:self.view.frame];
    self.activityIndicatorView.center = self.view.center;
    self.activityIndicatorView.activityIndicatorViewStyle =UIActivityIndicatorViewStyleWhiteLarge;
    [self.loadingView addSubview:self.activityIndicatorView];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.activityIndicatorView stopAnimating];
    [self.loadingView removeFromSuperview];
    UILabel *failLoadLabel = [[UILabel alloc]initWithFrame:self.view.frame];
    failLoadLabel.center = self.view.center;
    failLoadLabel.text = @"载入失败";
    failLoadLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:failLoadLabel];
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
