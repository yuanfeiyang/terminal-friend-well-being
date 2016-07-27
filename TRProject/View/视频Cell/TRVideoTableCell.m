//
//  TRVideoTableCell.m
//  TRProject
//
//  Created by spare on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRVideoTableCell.h"

@implementation TRVideoTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self imageCount];
        [self countLb];
        [self centerImage];
        [self control];
    }
    return self;
}
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        //当前视图设为view=bigimgView.userInteractionEnabled=NO 时，当前视图不可交互，该视图上面的子视图也不可交互（不可响应），响应事件传递到下面的父视图。
        //当前视图设为view=bigimgView.userInteractionEnabled=YES 时，当前视图可交互，该视图上面的子视图可以交互（可以响应），下面的父视图不会接收到响应。
        _iconImage.userInteractionEnabled = YES;
        
        _iconImage.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(kScreenW*90/160);
            
        }];
    }
    return _iconImage;
}

- (UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [UILabel new];
        _timeLb.font = [UIFont systemFontOfSize:14];
       // _timeLb.backgroundColor =[UIColor redColor];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(5);
            make.height.equalTo(20);
        }];
//        NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:_timeLb.text];
//        NSRange redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location);
//        [noteStr addAttribute:(NSString *)kCTForegroundColorAttributeName value:[UIColor greenColor] range:redRange];
//         [_timeLb setAttributedText:noteStr] ;
    }
    return _timeLb;
}
- (UILabel *)countLb{
    if (!_countLb) {
        _countLb = [UILabel new];
        _countLb.textColor = [UIColor greenColor];
        [self.contentView addSubview:_countLb];
        [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(5);
            make.right.equalTo(-5);
            //make.centerY.equalTo(self.timeLb);
            make.height.equalTo(20);
            
        }];
    }
    return _countLb;
}
- (UIImageView *)imageCount{
    if (!_imageCount) {
        _imageCount = [UIImageView new];
        _imageCount.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_imageCount];
        [_imageCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.timeLb);
            make.right.equalTo(self.countLb.mas_left).equalTo(-2);
            make.size.equalTo(CGSizeMake(15, 15));
        }];
    }
    return _imageCount;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:18];
        _titleLb.font = [UIFont fontWithName:@"Courier-BoldOblique" size:18];
        _titleLb.numberOfLines = 0;
        [_titleLb sizeToFit];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.left.equalTo(8);
            make.top.equalTo(self.timeLb.mas_bottom).equalTo(5);
            make.bottom.equalTo(self.iconImage.mas_top).equalTo(-5);
        }];
    }
    return _titleLb;
}
- (UIImageView *)centerImage{
    if (!_centerImage) {
        _centerImage = [UIImageView new];
        
        _centerImage.userInteractionEnabled = YES;
        _centerImage.contentMode = UIViewContentModeScaleAspectFill;
        [self.iconImage addSubview:_centerImage];
        [_centerImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.size.equalTo(CGSizeMake(50, 50));
        }];
    }
    return _centerImage;
}
- (UIControl *)control{
    if (!_control) {
        _control = [UIControl new];
        //_control.backgroundColor = [UIColor redColor];
        [self.centerImage addSubview:_control];
        
        [_control mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
    }
    return _control;
}

- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.titleLabel.font = [UIFont systemFontOfSize:12];
        [_button setTitle:@"举报" forState:UIControlStateNormal];
        [self.contentView addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.timeLb.mas_right).equalTo(5);
            make.centerY.equalTo(self.timeLb);
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
