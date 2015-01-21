//
//  BusinessCell.h
//  菜单项目
//
//  Created by Aga on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Business.h"
#import "UIImageView+AFNetworking.h"

@interface BusinessCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *score;
@property (weak, nonatomic) IBOutlet UILabel *scoreCOunt;
@property (weak, nonatomic) IBOutlet UILabel *cat;
@property (weak, nonatomic) IBOutlet UILabel *area;

@property (weak, nonatomic) IBOutlet UILabel *price;

@property (nonatomic, strong) Business *business;

@end
