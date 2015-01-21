//
//  FirstPageTableViewCell.h
//  菜单项目
//
//  Created by tarena1 on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstPageBusiness.h"
#import "UIImageView+AFNetworking.h"
@interface FirstPageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myName;
@property (weak, nonatomic) IBOutlet UILabel *myTicket;
@property (weak, nonatomic) IBOutlet UILabel *myPrice;
@property (weak, nonatomic) IBOutlet UILabel *mySellNumber;
@property(nonatomic,strong)FirstPageBusiness *firstPageBusiness;
@end
