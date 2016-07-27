//
//  TRInforMationViewModel.m
//  TRProject
//
//  Created by spare on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRInforMationViewModel.h"


@implementation TRInforMationViewModel
- (instancetype)initWithType:(InformationType)type{
    if (self = [super init]) {
        _informationType = type;
    }
    return self;
}

- (NSMutableArray<TRMilitaryModelImglist *> *)militoryList{
    if (!_militoryList) {
        _militoryList = [NSMutableArray new];
    }
    return _militoryList;
}
- (BOOL)isMore{
    return _isMore = self.militoryList.count != 0;
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
  
    
    NSInteger tmpPage = 0;
    
    
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page+1;
    }
    
        [TRIntentionNetManager getInformationDataListType:_informationType WithPage:tmpPage CompletionHandler:^(id model, NSError *error) {
            if (_informationType == InformationTypeMilitary) {
                _militoryModel = model;
                if (requestMode == VMRequestModeRefresh) {
                    [self.militoryList removeAllObjects];
                }
                 _numberCount = self.militoryList.count;
                [self.militoryList addObjectsFromArray:_militoryModel.imglist];
               
                
            }
            if (_informationType == InformationTypeMotor) {
                _motorModel = model;
                if (requestMode == VMRequestModeRefresh) {
                    [self.motorList removeAllObjects];
                }
                [self.motorList addObjectsFromArray:_motorModel.root.list];
            }
        
            _page = tmpPage;
            !completionHandler ?: completionHandler(error);
            
            
        }];
}

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










//---------------------- 摩托 ------------------------//
- (NSMutableArray<TRMotorModelRootList *> *)motorList{
    if (!_motorList) {
        _motorList = [NSMutableArray new];
    }
    return _motorList;
}
- (BOOL)isMoreMotor{
    return _isMoreMotor = self.motorList.count != 0;
}

//行数
- (NSInteger)rowNumberMotor{
    return self.motorList.count-2;
}
//标题
- (NSString *)titleMotorForRow:(NSInteger)row{
    return self.motorList[row+2].title;
}
//内容
- (NSString *)contentForRow:(NSInteger)row{
    return self.motorList[row+2].content168;
}
//作者
- (NSString *)authorForRow:(NSInteger)row{
    return self.motorList[row+2].author;
}
//阅读人数
- (NSString *)readartsForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"阅读 %ld",self.motorList[row+2].readarts];
}
//喜欢人数
- (NSString *)likecountForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld",self.motorList[row+2].likecount];
}
//图片
- (NSURL *)imgLinkForRow:(NSInteger)row{
    return self.motorList[row+2].imglink.yx_URL;
}
//跳转到web页面
- (NSURL *)urlForRow:(NSInteger)row{
    return self.motorList[row+2].url.yx_URL;
}
//更新时间
- (NSString *)timeForRow:(NSInteger)row{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //更新的时间戳
    NSDate *date = [formatter dateFromString:self.motorList[row+2].date];
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
    }
    if(hTime>1&&hTime<=24){
        return [NSString stringWithFormat:@"%ld小时前",hTime];
    }
    if(hTime>24&&hTime<=48){
        return @"一天前";
    }
    if(hTime>48&&hTime<=72){
        return @"两天前";
    }
    if(hTime>72&&hTime<=96){
        return @"两天前";
    }
    if (hTime>96&&hTime<=120) {
        return @"三天前";
    }
    if(hTime>120&&hTime<=144){
        return @"四天前";
    }
    if (hTime>144&&hTime<=168) {
        return @"五天前";
    }if (hTime>168&&hTime<=192) {
        return @"六天前";
    }
    return @"一周前";
    
}




@end
