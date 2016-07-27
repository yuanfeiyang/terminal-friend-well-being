//
//  TRDuanZiViewModel.m
//  TRProject
//
//  Created by spare on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRDuanZiViewModel.h"
#import "TRIntentionNetManager.h"

@implementation TRDuanZiViewModel
#pragma mark - LazyLoad 懒加载
- (NSMutableArray<TRDuanZiModelItems *> *)duanZiList{
    if (!_duanZiList) {
        _duanZiList = [NSMutableArray new];
    }
    return _duanZiList;
}
- (BOOL)isMore{
    return _isMore = self.duanZiList.count != 0;
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
    [TRIntentionNetManager getDuanZiWithPage:tmpPage PageSize:tmpPageSize MaxTimestamp:tmpStr LatestViewedTs:tmpLatestViewedTs CompletionHandler:^(id model, NSError *error) {
        _duanziModel = model;
        if (requestMode == VMRequestModeRefresh) {
            [self.duanZiList removeAllObjects];
        }
        [self.duanZiList addObjectsFromArray:_duanziModel.items];
        _page = tmpPage;
        _maxTimestamp = self.duanZiList.lastObject.updateTime;
        !completionHandler ?: completionHandler(error);
    }];
}
//.cell的行数
- (NSInteger)rowNumber{
    return self.duanZiList.count;
}
//cell上的内容标题
- (NSString *)wbodyForRow:(NSInteger)row{
    return self.duanZiList[row].wbody;
}
//cell上的点赞数量
- (NSString *)commentsForRow:(NSInteger)row{
    return self.duanZiList[row].comments;
}
//需要传入点击页面的wid
- (NSString *)widForRow:(NSInteger)row{
    return self.duanZiList[row].wid;
}

//cell上的更新时间
- (NSString *)updateTimeForRow:(NSInteger)row{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateFormat:@"HH:mm"];
    NSDate *confromTimes = [NSDate dateWithTimeIntervalSince1970:[self.duanZiList[row].updateTime integerValue]];
    NSString *timestring = [formatter stringFromDate:confromTimes];
    
    NSInteger time = [self.duanZiList[row].updateTime integerValue];
    
    
    NSDate *nowDate = [NSDate date];
    NSInteger time1 = [nowDate timeIntervalSince1970];
    
    NSString *nowStr = [formatter stringFromDate:nowDate];

    NSInteger hhTime = [[nowStr substringToIndex:2] integerValue];
    NSInteger mmTime = [[nowStr substringFromIndex:3] integerValue];
    //今天已过的秒数
    NSInteger thTime = hhTime*3600 + mmTime*60;
    //凌晨时间戳
    NSInteger tmTime = time1 - thTime;
    if (time - tmTime > 0) {
        return [NSString stringWithFormat:@"今天%@",timestring];
    }else if ((time - tmTime<0)&&(-(time-tmTime))<24*3600){
        return [NSString stringWithFormat:@"昨天%@",timestring];
    }else{
//        return [NSString stringWithFormat:@"两天前%@",timestring];
        return @"两天前";
    }
    return nil;
}

@end
