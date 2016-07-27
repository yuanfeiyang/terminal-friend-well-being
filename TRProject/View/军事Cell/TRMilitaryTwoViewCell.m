//
//  TRMilitaryTwoViewCell.m
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMilitaryTwoViewCell.h"

@implementation TRMilitaryTwoViewCell
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        _iconImage.contentMode =  UIViewContentModeScaleToFill;
        [self.contentView addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(200);
        }];
    }
    return _iconImage;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:12];
        _titleLb.numberOfLines = 0;
        [_titleLb sizeToFit];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-5);
            make.top.equalTo(self.iconImage.mas_bottom).equalTo(10);
            make.left.equalTo(10);
            make.right.equalTo(-10);
            //make.height.equalTo(50);
        }];
    }
    return _titleLb;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
