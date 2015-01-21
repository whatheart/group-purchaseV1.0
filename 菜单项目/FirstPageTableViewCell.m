//
//  FirstPageTableViewCell.m
//  菜单项目
//
//  Created by tarena1 on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "FirstPageTableViewCell.h"

@implementation FirstPageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
//在cell中显示内容
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.myImageView setImageWithURL:[NSURL URLWithString:self. firstPageBusiness.image]];
    self.myName.text = self.firstPageBusiness.title;
    self.myTicket.text = self.firstPageBusiness.desc;
    self.mySellNumber.text =[NSString stringWithFormat:@"已售量:%d",self.firstPageBusiness.download_count];
//    self.myPrice.text = [NSString stringWithFormat:@"%@",self.firstPageBusiness.title];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
