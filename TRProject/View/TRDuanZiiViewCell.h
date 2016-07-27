//
//  TRDuanZiiViewCell.h
//  TRProject
//
//  Created by spare on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRDuanZiiViewCell : UITableViewCell

/** 更新时间 */
@property (nonatomic) UILabel *timeLb;
/** 内容 */
@property (nonatomic) UILabel *titleLb;
/** <#属性描述#> */
@property (nonatomic) UIButton *button;

/** 点赞按钮 */
@property (nonatomic) UIControl *controlL;
/** 收藏按钮 */
@property (nonatomic) UIControl *controlR;

/** 点赞图片 */
@property (nonatomic) UIImageView *iconImageL;
/** 点赞+1图片 */
@property (nonatomic) UIImageView *iconImageOne;
/** 点赞计数 */
@property (nonatomic) UILabel *countLb;
/** 收藏按钮图片 */
@property (nonatomic) UIImageView *iconImageR;

/** 放控制器的View */
@property (nonatomic) UIView *viewL;
/** 放控制器的View */
@property (nonatomic) UIView *viewR;

/** 是否点赞 */
@property (nonatomic) BOOL isSupport;
/** 是否收藏 */
@property (nonatomic) BOOL isCollect;

@end
