//
//  TRMilitaryModel.m
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMilitaryModel.h"

@implementation TRMilitaryModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"imglist" : [TRMilitaryModelImglist class]};
}
@end
@implementation TRMilitaryModelImglist

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end



