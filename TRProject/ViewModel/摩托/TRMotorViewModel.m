//
//  TRMotorViewModel.m
//  TRProject
//
//  Created by spare on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMotorViewModel.h"
#import "TRIntentionNetManager.h"

@implementation TRMotorViewModel
- (NSMutableArray<TRMotorModelRootList *> *)motorList{
    if (!_motorList) {
        _motorList = [NSMutableArray new];
    }
    return _motorList;
}
- (BOOL)isMore{
    return _isMore = self.motorList.count != 0;
}

//- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
//    NSInteger tmpPage = 0;
//    if (requestMode == VMRequestModeMore) {
//        tmpPage = _page+1;
//        
//    }   
//    [TRIntentionNetManager getMotorWithPage:tmpPage CompletionHandler:^(id model, NSError *error) {
//        _motorModel = model;
//        if (requestMode == VMRequestModeRefresh) {
//            [self.motorList removeAllObjects];
//        }
//        [self.motorList addObjectsFromArray:_motorModel.root.list];
//        _page = tmpPage;
//        !completionHandler ?: completionHandler(error);
//
//    }];
//}
//行数
- (NSInteger)rowNumber{
    return self.motorList.count;
}
//标题
- (NSString *)titleForRow:(NSInteger)row{
    return self.motorList[row].title;
}
//内容
- (NSString *)contentForRow:(NSInteger)row{
    return self.motorList[row].content168;
}
//作者
- (NSString *)authorForRow:(NSInteger)row{
    return self.motorList[row].author;
}
//阅读人数
- (NSString *)readartsForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"阅读 %ld",self.motorList[row].readarts];
}
//喜欢人数
- (NSString *)likecountForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld",self.motorList[row].likecount];
}
//图片
- (NSURL *)imgLinkForRow:(NSInteger)row{
    return self.motorList[row].imglink.yx_URL;
}
//跳转到web页面
- (NSURL *)urlForRow:(NSInteger)row{
    return self.motorList[row].url.yx_URL;
}
//更新时间
- (NSString *)timeForRow:(NSInteger)row{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //更新的时间戳
    NSDate *date = [formatter dateFromString:self.motorList[row].date];
    NSInteger updateTime = [date timeIntervalSince1970];
    //现在的时间戳
    NSDate *nowDate = [NSDate date];
    NSInteger time1 = [nowDate timeIntervalSince1970];
    //两时间相差秒数
    NSInteger time = time1 - updateTime;
    //转化成小时
    NSInteger hTime = time/3600;
    
    if (hTime<=1) {
        NSInteger mTime = time/60;
        return [NSString stringWithFormat:@"%ld分钟前",mTime];
    }else{
        return [NSString stringWithFormat:@"%ld小时前",hTime];
    }

}
@end
