//
//  TRArticleModel.h
//  TRProject
//
//  Created by Yuanfeiyang on 16/7/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TRArticleModel : NSObject
//id->ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *cTime;
//weibo_pic->weiboPic
@property (nonatomic, copy) NSString *weiboPic;
@end

