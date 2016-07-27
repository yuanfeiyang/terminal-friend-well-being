//
//  TRDuanZiiViewCell.m
//  TRProject
//
//  Created by spare on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRDuanZiiViewCell.h"

@implementation TRDuanZiiViewCell

- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.titleLabel.font = [UIFont systemFontOfSize:12];
        [_button setTitle:@"举报" forState:UIControlStateNormal];
        [self.contentView addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.centerY.equalTo(self.timeLb);
            
        }];
    }
    return _button;
}
- (UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [UILabel new];
        _timeLb.textColor = [UIColor redColor];
        _timeLb.textAlignment = NSTextAlignmentLeft;
        _timeLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(5);
        }];
    }
    return _timeLb;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:16];
        _titleLb.textAlignment = NSTextAlignmentLeft;
        _titleLb.numberOfLines = 0;
        [_titleLb sizeToFit];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.top.equalTo(self.timeLb.mas_bottom).equalTo(5);
            make.right.equalTo(-5);
            make.bottom.equalTo(self.viewL.mas_top).equalTo(-5);
        }];
    }
    return _titleLb;
}

- (UIControl *)controlL{
    if (!_controlL) {
        _controlL = [[UIControl alloc]init];
        _controlL.backgroundColor = [UIColor whiteColor];
        [self.viewL addSubview:_controlL];
        [_controlL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _controlL;
}
- (UIImageView *)iconImageL{
    if (!_iconImageL) {
        _iconImageL = [UIImageView new];
        [self.viewL addSubview:_iconImageL];
        [_iconImageL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.size.equalTo(CGSizeMake(18, 18));
            make.centerY.equalTo(0);
        }];
    }
    return _iconImageL;
}
- (UILabel *)countLb{
    if (!_countLb) {
        _countLb = [UILabel new];
        [self.viewL addSubview:_countLb];
        [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageL.mas_right).equalTo(8);
            make.right.equalTo(-5);
            make.centerY.equalTo(self.iconImageL);
        }];
    }
    return _countLb;
}

- (UIControl *)controlR{
    if (!_controlR) {
        _controlR = [[UIControl alloc]init];
        _controlR.backgroundColor = [UIColor whiteColor];
        [self.viewR addSubview:_controlR];
        [_controlR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _controlR;
}
- (UIImageView *)iconImageR{
    if (!_iconImageR) {
        _iconImageR = [UIImageView new];
        [self.viewR addSubview:_iconImageR];
        [_iconImageR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.size.equalTo(CGSizeMake(18, 18));
        }];
    }
    return _iconImageR;
}
- (UIImageView *)iconImageOne{
    if (!_iconImageOne) {
        _iconImageOne = [UIImageView new];
        [self.controlL addSubview:_iconImageOne];
        [_iconImageOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.right.equalTo(-10 );
            make.size.equalTo(CGSizeMake(10, 10));
        }];
    }
    return _iconImageOne;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.isCollect = NO;
        self.isSupport = NO;
        [self iconImageOne];
        [self controlL];
        [self controlR];
        
    }
    return self;
}
- (UIView *)viewL{
    if (!_viewL) {
        _viewL = [UIView new];
        [self.contentView addSubview:_viewL];
        [_viewL mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.top.equalTo(self.titleLb.mas_bottom).equalTo(5);
            make.left.equalTo(5);
            make.bottom.equalTo(-5);
            make.width.equalTo(80);
            make.height.equalTo(30);
        }];
    }
    return _viewL;
}
- (UIView *)viewR{
    if (!_viewR) {
        _viewR = [UIView new];
        [self.contentView addSubview:_viewR];
        [_viewR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.bottom.equalTo(-5);
            make.size.equalTo(CGSizeMake(50, 30));
            //make.top.equalTo(self.titleLb.mas_bottom).equalTo(5);
        }];
    }
    return _viewR;
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
