//
//  TRArticleViewModel.m
//  TRProject
//
//  Created by Yuanfeiyang on 16/7/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRArticleViewModel.h"
#import "TRIntentionNetManager.h"
@implementation TRArticleViewModel
- (NSMutableArray<TRArticleModel *> *)articleList{
    if (!_articleList) {
        _articleList = [NSMutableArray new];
    }
    return _articleList;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSString *tmpStr = @"0";
    if (requestMode == VMRequestModeMore) {
        tmpStr = _ID;
    }
    [TRIntentionNetManager getArticleWithID:tmpStr CompletionHandler:^(id model, NSError *error) {
       
        _articleModel = model;
        
        [self.articleList removeAllObjects];
        
        [self.articleList addObjectsFromArray:_articleModel];
        _ID = self.articleList.lastObject.ID;
        
        !completionHandler ?: completionHandler(error);
       

    }];
    
    
}

- (NSInteger)rowNumber{
    return self.articleList.count;
}
- (NSString *)titleForRow:(NSInteger)row{
    return self.articleList[row].title;
}
- (NSURL *)picForRow:(NSInteger)row{
    return self.articleList[row].pic.yx_URL;
}
- (NSString *)updateTimeForRow:(NSInteger)row{
    return self.articleList[row].cTime;
}
- (NSString *)IDForRow:(NSInteger)row{
    return self.articleList[row].ID;
}
- (NSURL *)urlForRow:(NSInteger)row{
    return [NSString stringWithFormat:kURLPath,self.articleList[row].ID].yx_URL;
}
- (BOOL)isMore{
    return _isMore = self.articleList.count != 0;
}
@end
