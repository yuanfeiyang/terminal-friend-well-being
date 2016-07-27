//
//  TRInforMationViewModel.h
//  TRProject
//
//  Created by spare on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "TRMilitaryModel.h"
#import "TRMotorModel.h"
#import "TRIntentionNetManager.h"

@interface TRInforMationViewModel : TRBaseViewModel

@property (nonatomic,readonly)  InformationType informationType;

- (instancetype)initWithType:(InformationType)type;


/** 存储数据的可变数组 */
@property (nonatomic) NSMutableArray<TRMilitaryModelImglist *> *militoryList;
/** 接收model全部数据 */
@property (nonatomic) TRMilitaryModel *militoryModel;
/** 需要传入请求的page */
@property (nonatomic) NSInteger page;
/** 判断是否加载完  军事 */
@property (nonatomic) BOOL isMore;
/** 计算数组数量 */
@property (nonatomic) NSInteger numberCount;

/** tablalView的item个数 */
@property (nonatomic) NSInteger rowNumber;

/** 标题 */
- (NSString *)titleForRow:(NSInteger)row;
//图片
- (NSURL *)imgUrlForRow:(NSInteger)row;
//点击需要传递的id
- (NSString *)IDForRow:(NSInteger)row;



//-------------------------摩托--------------------------//

/** 存储数据的可变数组 */
@property (nonatomic) NSMutableArray<TRMotorModelRootList *> *motorList;
/** 接收model全部数据 */
@property (nonatomic) TRMotorModel *motorModel;
/** 需要传入请求的page */
@property (nonatomic) NSInteger pageMotor;
/** 判断是否加载完 */
@property (nonatomic) BOOL isMoreMotor;

/** tablalView的item个数 */
@property (nonatomic) NSInteger rowNumberMotor;
//标题
- (NSString *)titleMotorForRow:(NSInteger)row;
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
