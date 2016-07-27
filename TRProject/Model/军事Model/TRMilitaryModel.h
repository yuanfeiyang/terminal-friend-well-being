//
//  TRMilitaryModel.h
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRMilitaryModelImglist;
@interface TRMilitaryModel : NSObject


@property (nonatomic, copy) NSString *error;

@property (nonatomic, strong) NSArray<TRMilitaryModelImglist *> *imglist;

@end
@interface TRMilitaryModelImglist : NSObject
//id->ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<NSString *> *imgurls;

@property (nonatomic, copy) NSString *imgSum;

@property (nonatomic, copy) NSString *commentNum;

@property (nonatomic, copy) NSString *imageType;

@end



