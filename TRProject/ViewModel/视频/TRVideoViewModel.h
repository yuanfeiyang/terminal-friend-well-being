//
//  TRVideoViewModel.h
//  TRProject
//
//  Created by spare on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "TRVideoModel.h"

@interface TRVideoViewModel : TRBaseViewModel
/** 存储数据的可变数组 */
@property (nonatomic) NSMutableArray<TRVideoModelItems *> *VideoList;
/** 接收model全部数据 */
@property (nonatomic) TRVideoModel *VideoModel;
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
//cell上的内容标题
- (NSString *)wbodyForRow:(NSInteger)row;
//cell上的图片
- (NSURL *)iconImageForRow:(NSInteger)row;
//点击的视屏
- (NSURL *)videoForRow:(NSInteger)row;
//cell上的更新时间
- (NSString *)updateTimeForRow:(NSInteger)row;
//cell上显示观看的人数
- (NSString *)countsForRow:(NSInteger)row;
@end
