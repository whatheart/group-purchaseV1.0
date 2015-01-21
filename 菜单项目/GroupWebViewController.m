//
//  GroupWebViewController.m
//  菜单项目
//
//  Created by tarena1 on 15/1/18.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "GroupWebViewController.h"

@interface GroupWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation GroupWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.business.business_url]];
    NSLog(@"%@",self.business.business_url);
    [self.myWebView loadRequest:request];

    // Do any additional setup after loading the view.
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
