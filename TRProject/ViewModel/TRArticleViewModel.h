//
//  TRArticleViewModel.h
//  TRProject
//
//  Created by Yuanfeiyang on 16/7/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "TRArticleModel.h"
@interface TRArticleViewModel : TRBaseViewModel
@property (nonatomic) NSMutableArray<TRArticleModel *> *articleList;
/** 接收model全部数据 */
@property (nonatomic) NSArray<TRArticleModel *> *articleModel;
/** 需要传入请求的ID */
@property (nonatomic) NSString *ID;
/** 判断是否加载完 */
@property (nonatomic) BOOL isMore;

/** tableView的行数 */
@property (nonatomic) NSInteger rowNumber;
//cell上的内容标题
- (NSString *)titleForRow:(NSInteger)row;
//组头上的更新时间
- (NSString *)updateTimeForRow:(NSInteger)row;
//cell上的图片
- (NSURL *)picForRow:(NSInteger)row;
//传入下一页的id
- (NSString *)IDForRow:(NSInteger)row;
//需要传入点击页面的URL
- (NSURL *)urlForRow:(NSInteger)row;





@end
