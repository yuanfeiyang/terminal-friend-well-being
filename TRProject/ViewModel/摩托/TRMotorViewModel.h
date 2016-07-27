//
//  TRMotorViewModel.h
//  TRProject
//
//  Created by spare on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "TRMotorModel.h"

@interface TRMotorViewModel : TRBaseViewModel
/** 存储数据的可变数组 */
@property (nonatomic) NSMutableArray<TRMotorModelRootList *> *motorList;
/** 接收model全部数据 */
@property (nonatomic) TRMotorModel *motorModel;
/** 需要传入请求的page */
@property (nonatomic) NSInteger page;
/** 判断是否加载完 */
@property (nonatomic) BOOL isMore;

/** tablalView的item个数 */
@property (nonatomic) NSInteger rowNumber;
//标题
- (NSString *)titleForRow:(NSInteger)row;
//内容
- (NSString *)contentForRow:(NSInteger)row;
//作者
- (NSString *)authorForRow:(NSInteger)row;
//阅读人数
- (NSString *)readartsForRow:(NSInteger)row;
//喜欢人数
- (NSString *)likecountForRow:(NSInteger)row;
//更新时间
- (NSString *)timeForRow:(NSInteger)row;
//图片
- (NSURL *)imgLinkForRow:(NSInteger)row;
//跳转到web页面
- (NSURL *)urlForRow:(NSInteger)row;
@end
