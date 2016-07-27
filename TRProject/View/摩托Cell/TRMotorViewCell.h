//
//  TRMotorViewCell.h
//  TRProject
//
//  Created by spare on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRMotorViewCell : UITableViewCell
/**  图片 */
@property (nonatomic) UIImageView *iconImage;
/** 标题 */
@property (nonatomic) UILabel *titleLb;
/** 内容 */
@property (nonatomic) UILabel *contentLb;
/** 更新时间 */
@property (nonatomic) UILabel *timeLb;
/** 阅读人数 */
@property (nonatomic) UILabel *numberLb;
/** 作者 */
@property (nonatomic) UILabel *authorLb;
/** 举报按钮 */
@property (nonatomic) UIButton *button;

@end
