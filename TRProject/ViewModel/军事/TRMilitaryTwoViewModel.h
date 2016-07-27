//
//  TRMilitaryTwoViewModel.h
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRMilitaryTwoModel.h"
@interface TRMilitaryTwoViewModel : NSObject

- (void)getMilitaryWithID:(NSString *)ID CompletionHandler:(void(^)(NSError *error))completionHandler;

/** 存储数据的可变数组 */
@property (nonatomic) NSArray *descList;
/** <#属性描述#> */
@property (nonatomic) NSArray *imgurlsList;
/** 接收model全部数据 */
@property (nonatomic) TRMilitaryTwoModel *militoryTwoModel;
/** 需要传入请求的ID */
@property (nonatomic) NSString *ID;
/** 判断是否加载完 */
@property (nonatomic) BOOL isMore;

/** tablalView的item个数 */
@property (nonatomic) NSInteger rowNumber;

/** 标题 */
- (NSString *)titleForRow:(NSInteger)row;
//图片
- (NSURL *)urlForRow:(NSInteger)row;



@end
