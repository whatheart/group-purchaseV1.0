//
//  GroupPurchaseTableViewCell.m
//  菜单项目
//
//  Created by tarena1 on 15/1/16.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "GroupPurchaseTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation GroupPurchaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//在layout里初始化相应的值
-(void)layoutSubviews
{
    [super layoutSubviews];
//    商店名  地点 星级评分  距离  商店类型 团购图标  预定图片  大图  星级图片
    self.storeName.text = self.business.name;
    self.storeScene.text = self.business.address;
    self.starJudgeLabel.text =[NSString stringWithFormat:@"%d",self.business.review_count];
    self.storeDistance.text = [NSString stringWithFormat:@"%d",self.business.distance];
    self.storeType.text =self.business.categories[0];
    self.groupLabel.hidden = !self.business.has_deal;
    self.olderLabel.hidden = self.business.has_online_reservation;
    NSURL *url = [NSURL URLWithString:self.business.photo_url];
    [self.myImageView setImageWithURL:url];
    [self. myStarImageView setImageWithURL:[NSURL URLWithString:self.business.rating_s_img_url]];
    
    
}
@end
