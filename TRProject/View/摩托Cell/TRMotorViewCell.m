//
//  TRMotorViewCell.m
//  TRProject
//
//  Created by spare on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMotorViewCell.h"

@implementation TRMotorViewCell
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        _iconImage.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(5);
            make.right.equalTo(-5);
            make.height.equalTo(200);
        }];
    }
    return _iconImage;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.numberOfLines = 0;
        [_titleLb sizeToFit];
        _titleLb.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImage.mas_bottom).equalTo(8);
            make.left.equalTo(5);
            make.right.equalTo(-5);
        }];
    }
    return _titleLb;
}
- (UILabel *)contentLb{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        _contentLb.font = [UIFont systemFontOfSize:14];
        _contentLb.numberOfLines = 0;
        [_contentLb sizeToFit];
        [self.contentView addSubview:_contentLb];
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLb.mas_bottom).equalTo(10);
            make.left.equalTo(5);
            make.right.equalTo(-5);
            
        }];
    }
    return _contentLb;
}
- (UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [UILabel new];
        _timeLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentLb.mas_bottom).equalTo(10);
            make.left.equalTo(5);
            make.bottom.equalTo(-10);
        }];
    }
    return _timeLb;
}
- (UILabel *)numberLb{
    if (!_numberLb) {
        _numberLb = [UILabel new];
        _numberLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_numberLb];
        [_numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.timeLb.mas_right).equalTo(5);
            make.centerY.equalTo(self.timeLb);
        }];
    }
    return _numberLb;
}
- (UILabel *)authorLb{
    if (!_authorLb) {
        _authorLb = [UILabel new];
        _authorLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_authorLb];
        [_authorLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.centerY.equalTo(self.timeLb);
        }];
    }
    return _authorLb;
}
- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.titleLabel.font = [UIFont systemFontOfSize:12];
        [_button setTitle:@"举报" forState:UIControlStateNormal];
        [self.contentView addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.numberLb.mas_right).equalTo(5);
            make.centerY.equalTo(self.numberLb);
        }];
    }
    return _button;
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
