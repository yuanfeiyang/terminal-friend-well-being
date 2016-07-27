//
//  TRIntentionNetManager.h
//  TRProject
//
//  Created by spare on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,InformationType) {
    InformationTypeMotor,
    InformationTypeMilitary,
};

@interface TRIntentionNetManager : NSObject
+ (id)getDuanZiWithPage:(NSInteger)page PageSize:(NSInteger)pageSize MaxTimestamp:(NSString *)maxTimestamp LatestViewedTs:(NSString *)latestViewedTs CompletionHandler:(void(^)(id model,NSError *error))completionHandler;
+ (id)getMeiNvWithPage:(NSInteger)page PageSize:(NSInteger)pageSize MaxTimestamp:(NSString *)maxTimestamp LatestViewedTs:(NSString *)latestViewedTs CompletionHandler:(void(^)(id model,NSError *error))completionHandler;
+ (id)getVideoWithPage:(NSInteger)page PageSize:(NSInteger)pageSize MaxTimestamp:(NSString *)maxTimestamp LatestViewedTs:(NSString *)latestViewedTs CompletionHandler:(void(^)(id model,NSError *error))completionHandler;
//+ (id)getMotorWithPage:(NSInteger)page CompletionHandler:(void(^)(id model,NSError *error))completionHandler;

//+ (id)getMilitaryWithPage:(NSInteger)page CompletionHandler:(void(^)(id model,NSError *error))completionHandler;

+ (id)getMilitaryTwoWithID:(NSString *)ID CompletionHandler:(void(^)(id model,NSError *error))completionHandler;

+ (id)getInformationDataListType:(InformationType)type WithPage:(NSInteger)page CompletionHandler:(void(^)(id model,NSError *error))completionHandler;

+ (id)getArticleWithID:(NSString *)ID CompletionHandler:(void(^)(id model,NSError *error))completionHandler;
@end
