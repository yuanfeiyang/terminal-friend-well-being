//
//  TRDuanZiViewModel.h
//  TRProject
//
//  Created by spare on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "TRDuanZiModel.h"

@interface TRDuanZiViewModel : TRBaseViewModel
/** 存储数据的可变数组 */
@property (nonatomic) NSMutableArray<TRDuanZiModelItems *> *duanZiList;
/** 接收model全部数据 */
@property (nonatomic) TRDuanZiModel *duanziModel;
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

/** tableView的行数 */
@property (nonatomic) NSInteger rowNumber;
//cell上的内容标题
- (NSString *)wbodyForRow:(NSInteger)row;
//cell上的更新时间
- (NSString *)updateTimeForRow:(NSInteger)row;
//cell上的点赞数量
- (NSString *)commentsForRow:(NSInteger)row;
//需要传入点击页面的wid
- (NSString *)widForRow:(NSInteger)row;




@end
