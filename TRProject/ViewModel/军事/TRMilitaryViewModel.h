//
//  TRMilitaryViewModel.h
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "TRMilitaryModel.h"
@interface TRMilitaryViewModel : TRBaseViewModel
/** 存储数据的可变数组 */
@property (nonatomic) NSMutableArray<TRMilitaryModelImglist *> *militoryList;
/** 接收model全部数据 */
@property (nonatomic) TRMilitaryModel *militoryModel;
/** 需要传入请求的page */
@property (nonatomic) NSInteger page;
/** 判断是否加载完 */
@property (nonatomic) BOOL isMore;


/** tablalView的item个数 */
@property (nonatomic) NSInteger rowNumber;

/** 标题 */
- (NSString *)titleForRow:(NSInteger)row;
//图片
- (NSURL *)imgUrlForRow:(NSInteger)row;
//点击需要传递的id
- (NSString *)IDForRow:(NSInteger)row;



@end
