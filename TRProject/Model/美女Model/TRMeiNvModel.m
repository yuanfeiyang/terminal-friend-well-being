//
//  TRMeiNvModel.m
//  TRProject
//
//  Created by spare on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMeiNvModel.h"

@implementation TRMeiNvModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"items" : [TRMeiNvModelItems class]};
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
@implementation TRMeiNvModelLuaVersions
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"num":@"56",};
}
@end


@implementation TRMeiNvModelItems
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"wpicSmall":@"wpic_small",
             @"wSensitive":@"w_sensitive",
             @"wpicMWidth":@"wpic_m_width",
             @"isGif":@"is_gif",
             @"wpicMiddle":@"wpic_middle",
             @"wpicSHeight":@"wpic_s_height",
             @"wpicSWidth":@"wpic_s_width",
             @"wpicMHeight":@"wpic_m_height",
             @"wpicLarge":@"wpic_large",
             @"cmtDisabled":@"cmt_disabled",
             @"updateTime":@"update_time",
             };
}

@end


