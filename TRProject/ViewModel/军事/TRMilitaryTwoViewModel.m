//
//  TRMilitaryTwoViewModel.m
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMilitaryTwoViewModel.h"
#import "TRIntentionNetManager.h"

@implementation TRMilitaryTwoViewModel

- (void)getMilitaryWithID:(NSString *)ID CompletionHandler:(void (^)(NSError *))completionHandler{
    [TRIntentionNetManager getMilitaryTwoWithID:ID CompletionHandler:^(id model, NSError *error) {
        _militoryTwoModel = model;
        _descList = _militoryTwoModel.desc;
        _imgurlsList = _militoryTwoModel.imgurls;
        !completionHandler ?: completionHandler(error);
    }];
   
}
- (NSInteger)rowNumber{
    return _imgurlsList.count;
}
/** 标题 */
- (NSString *)titleForRow:(NSInteger)row{
    return _descList[row];
}
//图片
- (NSURL *)urlForRow:(NSInteger)row{
    return ((NSString *)_imgurlsList[row]).yx_URL;
}

@end
