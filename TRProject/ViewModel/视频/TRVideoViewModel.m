//
//  TRVideoViewModel.m
//  TRProject
//
//  Created by spare on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRVideoViewModel.h"
#import "TRIntentionNetManager.h"

@implementation TRVideoViewModel
- (NSMutableArray<TRVideoModelItems *> *)VideoList{
    if (!_VideoList) {
        _VideoList = [NSMutableArray new];
    }
    return _VideoList;
}
- (BOOL)isMore{
    return _isMore = self.VideoList.count != 0;
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    NSInteger tmpPageSize = 30;
    NSString *tmpStr = @"-1";
    NSString *tmpLatestViewedTs = @"1467622800";
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page+1;
        tmpPageSize = 15;
        tmpStr = _maxTimestamp;
        tmpLatestViewedTs = @"-1";
    }
    [TRIntentionNetManager getVideoWithPage:tmpPage PageSize:tmpPageSize MaxTimestamp:tmpStr LatestViewedTs:tmpLatestViewedTs CompletionHandler:^(id model, NSError *error) {
        _VideoModel = model;
        if (requestMode == VMRequestModeRefresh) {
            [self.VideoList removeAllObjects];
        }
        [self.VideoList addObjectsFromArray:_VideoModel.items];
        _page = tmpPage;
        _maxTimestamp = self.VideoList.lastObject.updateTime;
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSInteger)rowNumber{
    return self.VideoList.count;
}

//cell上的内容标题
- (NSString *)wbodyForRow:(NSInteger)row{
    return self.VideoList[row].wbody;
}
//cell上的图片
- (NSURL *)iconImageForRow:(NSInteger)row{
    return self.VideoList[row].vpicSmall.yx_URL;
}
//点击跳转视频
- (NSURL *)videoForRow:(NSInteger)row{
   return self.VideoList[row].vplayUrl.yx_URL;
}
//cell上显示观看的人数
- (NSString *)countsForRow:(NSInteger)row{
    NSInteger num = [self.VideoList[row].views integerValue];
    if (num>10000) {
        return [NSString stringWithFormat:@"%.f万",num/1000.0];
    }
    return self.VideoList[row].views;
}
//cell上的更新时间
- (NSString *)updateTimeForRow:(NSInteger)row{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateFormat:@"HH:mm"];
    NSDate *confromTimes = [NSDate dateWithTimeIntervalSince1970:[self.VideoList[row].updateTime integerValue]];
    NSString *timestring = [formatter stringFromDate:confromTimes];
    
    NSInteger time = [self.VideoList[row].updateTime integerValue];
    
    
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
