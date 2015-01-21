//
//  JsonParser.m
//  菜单项目
//
//  Created by Aga on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "JsonParser.h"

@implementation JsonParser

+ (Business *)parseBusinessbyDic:(NSDictionary *)dic
{
      Business *business = [[Business alloc] init];
  
        business.name = [dic objectForKey:@"name"];//商户名
        business.latitude = [[dic objectForKey:@"latitude"]floatValue];//纬度
        business.longitude = [[dic objectForKey:@"longitude"]floatValue];//经度
        business.avg_price = [[dic objectForKey:@"avg_price"]integerValue];
    //人均价格，若无，返回-1
        business.has_coupon = [[dic objectForKey:@"has_coupon"]integerValue];
    //是否有优惠信息,0:没有，1:有
        business.coupon_description = [dic objectForKey:@"coupon_description"];
    //优惠信息描述
        business.deal_count = [[dic objectForKey:@"deal_count"]integerValue];
    //已售数量
        business.has_deal = [[dic objectForKey:@"has_deal"]integerValue];
    //是否团购,0:没有，1:有
        business.has_online_reservation = [[dic objectForKey:@"has_online_reservation"]integerValue];
    //是否有在线预订，0:没有，1:有
        business.business_url = [dic objectForKey:@"business_url"];
    //商户页面链接
        business.city = [dic objectForKey:@"city"];
    //所在城市
        business.rating_img_url = [dic objectForKey:@"rating_img_url"];
    //星级图片链接
        business.rating_s_img_url = [dic objectForKey:@"rating_s_img_url"];
    //小尺寸星级图片链接
        business.photo_url = [dic objectForKey:@"photo_url"];
    //照片链接，最大尺寸为700*700
        business.s_photo_url = [dic objectForKey:@"s_photo_url"];
    //小尺寸照片链接，最大尺寸为278*200
        business.online_reservation_url = [dic objectForKey:@"online_reservation_url"];
    //在线预订页面链接，目前仅返回HTML5站点链接
        
        business.deals = [dic objectForKey:@"dic"];
    //团购列表
        business.review_count = [[dic objectForKey:@"review_count"]intValue];
    business.categories = [dic objectForKey:@"categories"];
    business.distance = [[dic objectForKey:@"distance"]intValue];
//    所在城市区域列表
    business.regions = [dic objectForKey:@"regions"];
      return business;
}
+(FirstPageBusiness *)parserKeywordBusinessByDictionary:(NSDictionary *)dictionary
{
    FirstPageBusiness *firstPageBusiness =[[FirstPageBusiness alloc]init];
    firstPageBusiness.bussinessName = [dictionary objectForKey:@"name"];
    firstPageBusiness.download_count = [[dictionary objectForKey:@"download_count"]intValue];
    firstPageBusiness.title = [dictionary objectForKey:@"title"];
    firstPageBusiness.desc = [dictionary objectForKey:@"description"];
    firstPageBusiness.regions = [dictionary objectForKey:@"regions"];
    firstPageBusiness.categories = [dictionary objectForKey:@"categories"];
    firstPageBusiness.image = [dictionary objectForKey:@"logo_img_url"];
    firstPageBusiness.bussiness_url = [dictionary objectForKey:@"coupon_h5_url"];
    return firstPageBusiness;
}

@end
