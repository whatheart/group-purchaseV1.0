//
//  BusinessCell.m
//  菜单项目
//
//  Created by Aga on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "BusinessCell.h"


@implementation BusinessCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.name.text = self.business.name;
    self.scoreCOunt.text = [NSString stringWithFormat:@"%ld人评价", (long)self.business.avg_price ];
    [self.image setImageWithURL:[NSURL URLWithString:self.business.photo_url]];
    [self.score setImageWithURL:[NSURL URLWithString:self.business.rating_img_url]];
    self.cat.text =[self.business.categories firstObject];
    self.area.text = [self.business.regions firstObject];
    self.price.text =[NSString stringWithFormat:@"￥ %d",self.business.avg_price];
}


@end
