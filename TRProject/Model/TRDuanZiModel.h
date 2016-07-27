//
//  TRDuanZiModel.h
//  TRProject
//
//  Created by spare on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRDuanZiModelLuaVersions,TRDuanZiModelItems;
@interface TRDuanZiModel : NSObject

@property (nonatomic, copy) NSString *category;

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

@property (nonatomic, strong) NSArray<TRDuanZiModelItems *> *items;

@property (nonatomic, copy) NSString *page;
//page_size->pageSize
@property (nonatomic, copy) NSString *pageSize;
//new_count->newCount
@property (nonatomic, copy) NSString *neWCount;
//lua_versions->luaVersions
@property (nonatomic, strong) TRDuanZiModelLuaVersions *luaVersions;



@end
@interface TRDuanZiModelLuaVersions : NSObject

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

@interface TRDuanZiModelItems : NSObject
//update_time->updateTime
@property (nonatomic, copy) NSString *updateTime;

@property (nonatomic, copy) NSString *comments;

@property (nonatomic, copy) NSString *uid;
//user_avatar->userAvatar
@property (nonatomic, copy) NSString *userAvatar;

@property (nonatomic, copy) NSString *wbody;

@property (nonatomic, copy) NSString *wid;

@property (nonatomic, copy) NSString *likes;
//w_sensitive->wSensitive
@property (nonatomic, copy) NSString *wSensitive;
//user_name->userName
@property (nonatomic, copy) NSString *userName;

@end

