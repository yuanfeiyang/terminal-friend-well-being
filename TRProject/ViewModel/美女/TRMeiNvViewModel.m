//
//  TRMeiNvViewModel.m
//  TRProject
//
//  Created by spare on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMeiNvViewModel.h"
#import "TRIntentionNetManager.h"

@implementation TRMeiNvViewModel
- (NSMutableArray<TRMeiNvModelItems *> *)MeiNvList{
    if (!_MeiNvList) {
        _MeiNvList = [NSMutableArray new];
    }
    return _MeiNvList;
}
- (BOOL)isMore{
    return _isMore = self.MeiNvList.count != 0;
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    NSInteger tmpPageSize = 30;
    NSString *tmpStr = @"-1";
    NSString *tmpLatestViewedTs = @"1467624600";
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page+1;
        tmpPageSize = 15;
        tmpStr = _maxTimestamp;
        tmpLatestViewedTs = @"-1";
    }
    [TRIntentionNetManager getMeiNvWithPage:tmpPage PageSize:tmpPageSize MaxTimestamp:tmpStr LatestViewedTs:tmpLatestViewedTs CompletionHandler:^(id model, NSError *error) {
        _MeiNvModel = model;
        if (requestMode == VMRequestModeRefresh) {
            [self.MeiNvList removeAllObjects];
        }
        [self.MeiNvList addObjectsFromArray:_MeiNvModel.items];
        _page = tmpPage;
        _maxTimestamp = self.MeiNvList.lastObject.updateTime;
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSInteger)rowNumber{
    return self.MeiNvList.count;
}
- (NSURL *)iconImageForItem:(NSInteger)item{
    return self.MeiNvList[item].wpicMiddle.yx_URL;
}
- (NSURL *)selectIconImageForItem:(NSInteger)item{
    return self.MeiNvList[item].wpicLarge.yx_URL;
}

@end
