//
//  TRVideoModel.m
//  TRProject
//
//  Created by spare on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRVideoModel.h"

@implementation TRVideoModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"items" : [TRVideoModelItems class]};
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
@implementation TRVideoModelLuaVersions
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"num":@"56",};
}
@end


@implementation TRVideoModelItems
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"vpicSmall":@"vpic_small",
             @"wSensitive":@"w_sensitive",
             @"vpicMiddle":@"vpic_middle",
             @"fetchPlayUrl":@"fetch_play_url",
             @"siteCode":@"site_code",
             @"noCopyright":@"no_copyright",
             @"vplayUrl":@"vplay_url",
             @"userName":@"user_name",
             @"userAvatar":@"user_avatar",
             @"updateTime":@"update_time",
             @"vsourceUrl":@"vsource_url",
        };
}

@end


