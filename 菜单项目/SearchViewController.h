//
//  SearchViewController.h
//  菜单项目
//
//  Created by tarena1 on 15/1/18.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySC;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,copy)NSString *keyword;
@property (nonatomic, strong)NSMutableArray *businesses;
@end
