//
//  TRMeiNvModel.h
//  TRProject
//
//  Created by spare on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRMeiNvModelLuaVersions,TRMeiNvModelItems;
@interface TRMeiNvModel : NSObject


@property (nonatomic, assign) NSInteger vip;
//use_adview->useAdview
@property (nonatomic, assign) NSInteger useAdview;
//data_server_url->dataServerUrl
@property (nonatomic, copy) NSString *dataServerUrl;
//in_review_app_ver->inReviewAppVer
@property (nonatomic, copy) NSString *inReviewAppVer;
//use_ls_ad_mgr->useLsAdMgr
@property (nonatomic, assign) NSInteger useLsAdMgr;

@property (nonatomic, assign) NSInteger total;
//comments_hidden->commentsHidden
@property (nonatomic, assign) NSInteger commentsHidden;

@property (nonatomic, assign) NSInteger encrypted;

@property (nonatomic, copy) NSString *ip;

@property (nonatomic, strong) NSArray<TRMeiNvModelItems *> *items;

@property (nonatomic, copy) NSString *page;
//page_size->pageSize
@property (nonatomic, copy) NSString *pageSize;
//new_count->newCount
@property (nonatomic, copy) NSString *neWCount;
//lua_versions->luaVersions
@property (nonatomic, strong) TRMeiNvModelLuaVersions *luaVersions;

@end
@interface TRMeiNvModelLuaVersions : NSObject

@property (nonatomic, assign) NSInteger miaopai;

@property (nonatomic, assign) NSInteger tudou;

@property (nonatomic, assign) NSInteger iqiyi;

@property (nonatomic, assign) NSInteger youku;

@property (nonatomic, assign) NSInteger acfun;

@property (nonatomic, assign) NSInteger vlook;
//56->num
@property (nonatomic, assign) NSInteger num;

@property (nonatomic, assign) NSInteger sohu;

@property (nonatomic, assign) NSInteger bilibili;

@property (nonatomic, assign) NSInteger weibo;

@property (nonatomic, assign) NSInteger fengxing;

@end

@interface TRMeiNvModelItems : NSObject

@property (nonatomic, copy) NSString *comments;
//wpic_small->wpicSmall
@property (nonatomic, copy) NSString *wpicSmall;
//w_sensitive->wSensitive
@property (nonatomic, copy) NSString *wSensitive;
//wpic_m_width->wpicMWidth
@property (nonatomic, copy) NSString *wpicMWidth;

@property (nonatomic, copy) NSString *likes;
//is_gif->isGif
@property (nonatomic, copy) NSString *isGif;
//wpic_middle->wpicMiddle
@property (nonatomic, copy) NSString *wpicMiddle;
//wpic_s_height->wpicSHeight
@property (nonatomic, copy) NSString *wpicSHeight;

@property (nonatomic, copy) NSString *wbody;

@property (nonatomic, copy) NSString *wid;
//wpic_s_width->wpicSWidth
@property (nonatomic, copy) NSString *wpicSWidth;
//wpic_m_height->wpicMHeight
@property (nonatomic, copy) NSString *wpicMHeight;
//wpic_large->wpicLarge
@property (nonatomic, copy) NSString *wpicLarge;
//cmt_disabled->cmtDisabled
@property (nonatomic, copy) NSString *cmtDisabled;
//update_time->updateTime
@property (nonatomic, copy) NSString *updateTime;

@end

