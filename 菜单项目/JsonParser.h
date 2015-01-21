//
//  JsonParser.h
//  菜单项目
//
//  Created by Aga on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Business.h"
#import "FirstPageBusiness.h"

@interface JsonParser : NSObject

+ (Business *)parseBusinessbyDic:(NSDictionary *)dic;
+(FirstPageBusiness *)parserKeywordBusinessByDictionary:(NSDictionary *)dictionary;
@end
