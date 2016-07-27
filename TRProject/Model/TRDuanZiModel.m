//
//  TRDuanZiModel.m
//  TRProject
//
//  Created by spare on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRDuanZiModel.h"

@implementation TRDuanZiModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"items" : [TRDuanZiModelItems class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{ @"useAdview":@"use_adview",
              @"dataServerUrl":@"data_server_url",
              @"inReviewAppVer":@"in_review_app_ver",
              @"useLsAdMgr":@"use_ls_ad_mgr",
              @"commentsHidden":@"comments_hidden",
              @"pageSize":@"page_size",
              @"newCount":@"new_count",
              @"luaVersions":@"lua_versions",
             };
}


@end

@implementation TRDuanZiModelLuaVersions
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"num":@"56",};
}
@end

@implementation TRDuanZiModelItems
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"updateTime":@"update_time",
             @"userAvatar":@"user_avatar",
             @"wSensitive":@"w_sensitive",
             @"userName":@"user_name",
             };
}
@end