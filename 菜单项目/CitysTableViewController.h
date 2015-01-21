//
//  CitysTableViewController.h
//  菜单项目
//
//  Created by tarena1 on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRUtils.h"
#import "PinYinForObjc.h"
#import "ChineseInclude.h"
#import "AFNetworking.h"
#import "FIrstPageViewController.h"
@interface CitysTableViewController : UITableViewController
//声明一个数组，用来保存城市
@property(nonatomic,strong)NSMutableArray *citys;
//声明一个UISearchDisplayController
@property(nonatomic,strong)UISearchDisplayController *mySearchDisplayController;
@property(nonatomic,weak)FIrstPageViewController *firstPageViewController;
@end
