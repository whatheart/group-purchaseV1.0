//
//  TRUtils.h
//  Day13Tuan
//
//  Created by tarena on 15-1-14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRUtils : NSObject
+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params;
@end
