//
//  FirstPageBusiness.h
//  菜单项目
//
//  Created by tarena1 on 15/1/16.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstPageBusiness : NSObject
//商品名
@property(nonatomic,copy)NSString *bussinessName;
//优惠券当前下载量
@property(nonatomic,assign)int download_count;
//优惠券标题
@property(nonatomic,copy)NSString *title;
//优惠券描述
@property(nonatomic,copy)NSString *desc;
//优惠券适合商户所在行政区
@property(nonatomic,strong)NSArray *regions;
//优惠券所在分类
@property(nonatomic,strong)NSArray *categories;
//优惠券所适合的商户列表
@property(nonatomic,strong)NSArray *businesses;
//优惠券图标
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *bussiness_url;
@end
