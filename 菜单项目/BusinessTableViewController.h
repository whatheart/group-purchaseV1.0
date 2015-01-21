//
//  BusinessTableViewController.h
//  菜单项目
//
//  Created by Aga on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessCell.h"
#import "AFNetworking.h"
#import "TRUtils.h"
#import "Business.h"
#import "JsonParser.h"
@interface BusinessTableViewController : UITableViewController
@property (nonatomic, copy) NSString *clickName;
@property (nonatomic, copy) NSString *city;
//声明一个属性，用于美食界面的传值
@property(nonatomic,copy)NSString *business;

@end
