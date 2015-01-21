//
//  GroupPurchaseTableViewCell.h
//  菜单项目
//
//  Created by tarena1 on 15/1/16.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Business.h"
@interface GroupPurchaseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
//照片链接
@property (weak, nonatomic) IBOutlet UIImageView *myStarImageView;//小尺寸图片链接
@property (weak, nonatomic) IBOutlet UILabel *storeName;  //商户名
@property (weak, nonatomic) IBOutlet UILabel *starJudgeLabel;//星级评分
@property (weak, nonatomic) IBOutlet UILabel *storeType; //商店类型
@property (weak, nonatomic) IBOutlet UILabel *storeScene;//地点
@property (weak, nonatomic) IBOutlet UILabel *storeDistance;//距离
@property(nonatomic,strong)Business *business;
@property (weak, nonatomic) IBOutlet UIImageView *groupLabel;
@property (weak, nonatomic) IBOutlet UIImageView *olderLabel;
@property(nonatomic,copy)NSString *imageURL;
@end
