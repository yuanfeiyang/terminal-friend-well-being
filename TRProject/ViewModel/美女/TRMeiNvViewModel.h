//
//  TRMeiNvViewModel.h
//  TRProject
//
//  Created by spare on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "TRMeiNvModel.h"
@interface TRMeiNvViewModel : TRBaseViewModel
/** 存储数据的可变数组 */
@property (nonatomic) NSMutableArray<TRMeiNvModelItems *> *MeiNvList;
/** 接收model全部数据 */
@property (nonatomic) TRMeiNvModel *MeiNvModel;
/** 需要传入请求的page */
@property (nonatomic) NSInteger page;
/** 需要传入请求的pageSize */
@property (nonatomic) NSInteger pageSize;
/** 需要传入请求的maxTimestamp */
@property (nonatomic) NSString *maxTimestamp;
/** 需要传入latestViewedTs */
@property (nonatomic) NSString *latestViewedTs;
/** 判断是否加载完 */
@property (nonatomic) BOOL isMore;

/** ColletionView的item个数 */
@property (nonatomic) NSInteger rowNumber;
//请求的图片
- (NSURL *)iconImageForItem:(NSInteger)item;
- (NSURL *)selectIconImageForItem:(NSInteger)item;

@end
