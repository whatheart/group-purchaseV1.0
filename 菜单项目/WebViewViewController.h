//
//  WebViewViewController.h
//  菜单项目
//
//  Created by tarena1 on 15/1/17.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewViewController : UIViewController<UIWebViewDelegate>
@property(nonatomic,copy)NSString *webUrl;
@property(nonatomic,copy)NSString *businessName;
@end
