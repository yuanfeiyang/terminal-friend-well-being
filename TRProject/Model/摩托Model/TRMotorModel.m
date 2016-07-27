//
//  TRMotorModel.m
//  TRProject
//
//  Created by spare on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMotorModel.h"

@implementation TRMotorModel


@end
@implementation TRMotorModelRoot
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list" : [TRMotorModelRootList class]};
}
@end


@implementation TRMotorModelRootList

@end


@implementation TRMotorModelRootListId

@end



