//
//  TRVideoModel.h
//  TRProject
//
//  Created by spare on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRVideoModelLuaVersions,TRVideoModelItems;
@interface TRVideoModel : NSObject

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

@property (nonatomic, strong) NSArray<TRVideoModelItems *> *items;

@property (nonatomic, copy) NSString *page;
//page_size->pageSize
@property (nonatomic, copy) NSString *pageSize;
//new_count->newCount
@property (nonatomic, copy) NSString *neWCount;
//lua_versions->luaVersions
@property (nonatomic, strong) TRVideoModelLuaVersions *luaVersions;

@end
@interface TRVideoModelLuaVersions : NSObject

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

@interface TRVideoModelItems : NSObject

@property (nonatomic, copy) NSString *views;

@property (nonatomic, copy) NSString *comments;
//vpic_small->vpicSmall
@property (nonatomic, copy) NSString *vpicSmall;
//w_sensitive->wSensitive
@property (nonatomic, copy) NSString *wSensitive;

@property (nonatomic, copy) NSString *uid;
//site_code->siteCode
@property (nonatomic, copy) NSString *siteCode;

@property (nonatomic, copy) NSString *likes;
//vpic_middle->vpicMiddle
@property (nonatomic, copy) NSString *vpicMiddle;
//fetch_play_url->fetchPlayUrl
@property (nonatomic, copy) NSString *fetchPlayUrl;
//no_copyright->noCopyright
@property (nonatomic, copy) NSString *noCopyright;
//vplay_url->vplayUrl
@property (nonatomic, copy) NSString *vplayUrl;

@property (nonatomic, copy) NSString *wbody;

@property (nonatomic, copy) NSString *wid;
//user_name->userName
@property (nonatomic, copy) NSString *userName;
//user_avatar->userAvatar
@property (nonatomic, copy) NSString *userAvatar;
//update_time->updateTime
@property (nonatomic, copy) NSString *updateTime;
//vsource_url->vsourceUrl
@property (nonatomic, copy) NSString *vsource_url;

@end

