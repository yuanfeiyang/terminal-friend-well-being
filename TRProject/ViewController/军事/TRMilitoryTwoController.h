//
//  TRMilitoryTwoController.h
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRMilitoryTwoController : UITableViewController

/** 需要传递的 */
@property (nonatomic) NSString *ID;
- (instancetype)initWithID:(NSString *)ID;
@end
