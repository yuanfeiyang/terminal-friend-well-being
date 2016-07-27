//
//  TRMilitaryViewCell.m
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMilitaryViewCell.h"

@implementation TRMilitaryViewCell
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        _iconImage.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _iconImage;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.textColor = [UIColor whiteColor];
        [self.iconImage addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.left.equalTo(20);
            //make.right.equalTo(-10);
            make.centerX.equalTo(0);
            make.bottom.equalTo(-20);
        }];
    }
    return _titleLb;
}

@end
