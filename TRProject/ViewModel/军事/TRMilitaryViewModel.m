//
//  TRMilitaryViewModel.m
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMilitaryViewModel.h"
#import "TRIntentionNetManager.h"

@implementation TRMilitaryViewModel

- (NSMutableArray<TRMilitaryModelImglist *> *)militoryList{
    if (!_militoryList) {
        _militoryList = [NSMutableArray new];
    }
    return _militoryList;
}
- (BOOL)isMore{
    return _isMore = self.militoryList.count != 0;
}

//- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
//    NSInteger tmpPage = 1;
//    if (requestMode == VMRequestModeMore) {
//        tmpPage = _page+1;
//        
//    }
//    [TRIntentionNetManager getMilitaryWithPage:tmpPage CompletionHandler:^(id model, NSError *error) {
//        _militoryModel = model;
//        if (requestMode == VMRequestModeRefresh) {
//            [self.militoryList removeAllObjects];
//        }
//        [self.militoryList addObjectsFromArray:_militoryModel.imglist];
//        _page = tmpPage;
//        !completionHandler ?: completionHandler(error);
//        
//    }];
//
//}

//行数
- (NSInteger)rowNumber{
    return self.militoryList.count;
}
/** 标题 */
- (NSString *)titleForRow:(NSInteger)row{
    return self.militoryList[row].title;
}
//图片
- (NSURL *)imgUrlForRow:(NSInteger)row{
    return self.militoryList[row].imgurls[0].yx_URL;
}
//点击需要传递的id
- (NSString *)IDForRow:(NSInteger)row{
    return self.militoryList[row].ID;
}
@end
