//
//  TRArticleModel.m
//  TRProject
//
//  Created by Yuanfeiyang on 16/7/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRArticleModel.h"

@implementation TRArticleModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID" : @"id",
             @"weiboPic" : @"weibo_pic"
             };
}

@end



