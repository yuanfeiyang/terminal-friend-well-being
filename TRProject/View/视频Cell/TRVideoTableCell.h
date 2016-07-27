//
//  TRVideoTableCell.h
//  TRProject
//
//  Created by spare on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRVideoTableCell : UITableViewCell
/** 图片 */
@property (nonatomic) UIImageView *iconImage;
/** 标题 */
@property (nonatomic) UILabel *titleLb;
/** 更新时间 */
@property (nonatomic) UILabel *timeLb;
/** 观看人数 */
@property (nonatomic) UILabel *countLb;
/** 观看人数图片 */
@property (nonatomic) UIImageView *imageCount;

/** 单击播放图标 */
@property (nonatomic) UIImageView *centerImage;
/** 点击跳转播放页面 */
@property (nonatomic) UIControl *control;
/** 举报按钮 */
@property (nonatomic) UIButton *button;


@end
