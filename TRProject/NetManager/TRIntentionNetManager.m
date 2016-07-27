//
//  TRIntentionNetManager.m
//  TRProject
//
//  Created by spare on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRIntentionNetManager.h"
#import "TRDuanZiModel.h"
#import "TRMeiNvModel.h"
#import "TRVideoModel.h"
#import "TRMotorModel.h"
#import "TRMilitaryModel.h"
#import "TRMilitaryTwoModel.h"
#import "TRArticleModel.h"
@implementation TRIntentionNetManager
+ (id)getDuanZiWithPage:(NSInteger)page PageSize:(NSInteger)pageSize MaxTimestamp:(NSString *)maxTimestamp LatestViewedTs:(NSString *)latestViewedTs CompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kDuanZiPath,page,pageSize,maxTimestamp,latestViewedTs];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([TRDuanZiModel parseJSON:jsonObject],error);
    }];
    
}
+ (id)getMeiNvWithPage:(NSInteger)page PageSize:(NSInteger)pageSize MaxTimestamp:(NSString *)maxTimestamp LatestViewedTs:(NSString *)latestViewedTs CompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kMeiNvPath,page,pageSize,maxTimestamp,latestViewedTs];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([TRMeiNvModel parseJSON:jsonObject],error);
    }];

}
+ (id)getVideoWithPage:(NSInteger)page PageSize:(NSInteger)pageSize MaxTimestamp:(NSString *)maxTimestamp LatestViewedTs:(NSString *)latestViewedTs CompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kVideoPath,page,pageSize,maxTimestamp,latestViewedTs];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([TRVideoModel parseJSON:jsonObject],error);
    }];
    
}
//+ (id)getMotorWithPage:(NSInteger)page CompletionHandler:(void (^)(id, NSError *))completionHandler{
//    NSString *path = [NSString stringWithFormat:kMotorPath,page];
//    return [self GETMotor:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
//        !completionHandler ?: completionHandler([TRMotorModel parseJSON:jsonObject],error);
//    }];
//}
//+ (id)getMilitaryWithPage:(NSInteger)page CompletionHandler:(void (^)(id, NSError *))completionHandler{
//    
//    NSString *path = [NSString stringWithFormat:kMilitaryPath,page];
//    return [self GETMotor:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
//        !completionHandler ?: completionHandler([TRMilitaryModel parseJSON:jsonObject],error);
//    }];
//
//}
+ (id)getMilitaryTwoWithID:(NSString *)ID CompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kMilitaryTwoPath,ID];
    return [self GETMotor:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([TRMilitaryTwoModel parseJSON:jsonObject],error);
    }];

}

+ (id)getInformationDataListType:(InformationType)type WithPage:(NSInteger)page CompletionHandler:(void (^)(id, NSError *))completionHandler{
    switch (type) {
        case InformationTypeMotor: {
            //NSInteger page1 = page+1;
            NSString *path = [NSString stringWithFormat:kMotorPath,page];
            return [self GETMotor:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
                !completionHandler ?: completionHandler([TRMotorModel parseJSON:jsonObject],error);
            }];
            break;
        }
        case InformationTypeMilitary: {
            NSInteger page1 = page+1;
            NSString *path = [NSString stringWithFormat:kMilitaryPath,page1];
            return [self GETMotor:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
                !completionHandler ?: completionHandler([TRMilitaryModel parseJSON:jsonObject],error);
            }];
            break;
        }
    }
    
}
+ (id)getArticleWithID:(NSString *)ID CompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kArticlePath,ID];
    return [self GETMotor:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([TRArticleModel parseJSON:jsonObject],error);
    }];
    
    
//    return [self GETMotor:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
//        NSLog(@"jsonObject:%@",jsonObject);
//        !completionHandler ?: completionHandler([TRArticleModel parseJSON:jsonObject],error);
//    }];
}

@end
